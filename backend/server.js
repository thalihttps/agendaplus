// Servidor de API REST (Node.js + Express) - AgendaPlus
const express = require('express');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

// Rota de Teste de Status da API
app.get('/api/status', (req, res) => {
    res.json({ status: 'API AgendaPlus Rodando com Sucesso', version: '1.0.0' });
});

// Rotas da API de Agendamentos
app.get('/api/services', (req, res) => {
    res.json([
        { id: 's1', providerName: 'Dra. Camilla Rocha', title: 'Consulta Dermatológica', category: 'Saúde', city: 'São Paulo', price: 250 },
        { id: 's2', providerName: 'Dr. Lucas Sampaio', title: 'Sessão de Fisioterapia', category: 'Saúde', city: 'Rio de Janeiro', price: 180 }
    ]);
});

app.post('/api/appointments', (req, res) => {
    const appointment = req.body;
    res.status(201).json({ message: 'Agendamento salvo no banco de dados com sucesso', data: appointment });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});
