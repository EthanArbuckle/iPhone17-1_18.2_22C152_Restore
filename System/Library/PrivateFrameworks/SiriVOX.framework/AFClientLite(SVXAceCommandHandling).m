@interface AFClientLite(SVXAceCommandHandling)
- (void)handleAceCommand:()SVXAceCommandHandling reply:;
@end

@implementation AFClientLite(SVXAceCommandHandling)

- (void)handleAceCommand:()SVXAceCommandHandling reply:
{
  id v6 = a4;
  v7 = (objc_class *)MEMORY[0x263F28580];
  id v8 = a3;
  id v9 = [v7 alloc];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __62__AFClientLite_SVXAceCommandHandling__handleAceCommand_reply___block_invoke;
  v20[3] = &unk_264552590;
  id v21 = v6;
  id v10 = v6;
  v11 = (void *)[v9 initWithBlock:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __62__AFClientLite_SVXAceCommandHandling__handleAceCommand_reply___block_invoke_2;
  v18[3] = &unk_2645525B8;
  id v12 = v11;
  id v19 = v12;
  v13 = (void *)MEMORY[0x223C65C40](v18);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__AFClientLite_SVXAceCommandHandling__handleAceCommand_reply___block_invoke_3;
  v16[3] = &unk_2645525E0;
  id v17 = v12;
  id v14 = v12;
  v15 = (void *)MEMORY[0x223C65C40](v16);
  [a1 handleCommand:v8 afterCurrentRequest:0 commandHandler:v13 completion:v15];
}

@end