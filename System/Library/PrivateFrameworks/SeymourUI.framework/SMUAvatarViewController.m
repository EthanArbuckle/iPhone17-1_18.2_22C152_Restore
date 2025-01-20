@interface SMUAvatarViewController
+ (id)descriptorForRequiredKeys;
- (SMUAvatarViewController)init;
- (UIView)view;
- (void)setContact:(id)a3;
@end

@implementation SMUAvatarViewController

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_onceToken != -1) {
    dispatch_once(&descriptorForRequiredKeys_onceToken, &__block_literal_global);
  }
  v2 = (void *)descriptorForRequiredKeys__descriptor;

  return v2;
}

void __52__SMUAvatarViewController_descriptorForRequiredKeys__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x263EFEBC0]);
  uint64_t v0 = [v2 descriptorForRequiredKeys];
  v1 = (void *)descriptorForRequiredKeys__descriptor;
  descriptorForRequiredKeys__descriptor = v0;
}

- (SMUAvatarViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)SMUAvatarViewController;
  id v2 = [(SMUAvatarViewController *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFEBC8] defaultSettings];
    uint64_t v4 = [objc_alloc(MEMORY[0x263EFEBC0]) initWithSettings:v3];
    avatarViewController = v2->_avatarViewController;
    v2->_avatarViewController = (CNAvatarViewController *)v4;

    uint64_t v6 = [(CNAvatarViewController *)v2->_avatarViewController view];
    view = v2->view;
    v2->view = (UIView *)v6;
  }
  return v2;
}

- (void)setContact:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v8 = a3;
    uint64_t v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = a3;
    id v6 = [v4 arrayWithObjects:&v8 count:1];
    -[CNAvatarViewController setContacts:](self->_avatarViewController, "setContacts:", v6, v8, v9);
  }
  else
  {
    avatarViewController = self->_avatarViewController;
    id v6 = 0;
    [(CNAvatarViewController *)avatarViewController setContacts:MEMORY[0x263EFFA68]];
  }
}

- (UIView)view
{
  return self->view;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->view, 0);

  objc_storeStrong((id *)&self->_avatarViewController, 0);
}

@end