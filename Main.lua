local url = "https://github.com/zen-browser/desktop/releases/download/1.21.10b/zen.installer.exe"
local destino = "G:\\Steam\\zen.installer.exe"

function init(self)
    print("Iniciando download...")
    print("URL: " .. url)

    http.request(url, "GET", {}, function(self, id, response)
        print("Status HTTP: " .. tostring(response.status))

        if response.status == 200 then
            print("Download concluído.")
            print("Tamanho: " .. tostring(#response.response) .. " bytes")

            local arquivo = io.open(destino, "wb")

            if arquivo then
                arquivo:write(response.response)
                arquivo:close()

                print("SUCESSO!")
                print("Salvo em: " .. destino)
            else
                print("ERRO: não foi possível abrir:")
                print(destino)
            end
        else
            print("ERRO no download.")
            print("HTTP: " .. tostring(response.status))
        end
    end)
end
