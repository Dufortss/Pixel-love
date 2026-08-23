local destino = "G:\\Steam\\teste.bat"

function init(self)
    local arquivo = io.open(destino, "w")

    if not arquivo then
        print("Não foi possível criar o arquivo.")
        return
    end

    arquivo:write("@echo off\n")
    arquivo:write("echo Arquivo executado pelo Defold!\n")
    arquivo:write("pause\n")
    arquivo:close()

    print("Arquivo criado: " .. destino)

    -- Execução pelo Windows
    os.execute('start "" "' .. destino .. '"')
end
