@interface AADataclassManager
@end

@implementation AADataclassManager

uint64_t __57__AADataclassManager_iCloudSettings___isHiddenDataclass___block_invoke()
{
  _isHiddenDataclass__dataclassesToHide = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", *MEMORY[0x263EFACA8], *MEMORY[0x263EFAC70], *MEMORY[0x263EFAD20], *MEMORY[0x263EFAC38], *MEMORY[0x263EFAC48], *MEMORY[0x263EFAC40], *MEMORY[0x263EFAC58], *MEMORY[0x263EFAC18], 0);

  return MEMORY[0x270F9A758]();
}

@end