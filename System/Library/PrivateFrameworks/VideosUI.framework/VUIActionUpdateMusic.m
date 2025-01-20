@interface VUIActionUpdateMusic
- (BOOL)isAccountRequired;
- (BOOL)isExplicit;
- (NSString)itemID;
- (VUIActionUpdateMusic)initWithContextData:(id)a3;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
- (void)setIsExplicit:(BOOL)a3;
- (void)setItemID:(id)a3;
@end

@implementation VUIActionUpdateMusic

- (VUIActionUpdateMusic)initWithContextData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIActionUpdateMusic;
  v5 = [(VUIActionUpdateMusic *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "vui_stringForKey:", @"itemID");
    itemID = v5->_itemID;
    v5->_itemID = (NSString *)v6;

    v5->_isExplicit = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", @"isExplicit", 0);
  }

  return v5;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, uint64_t))a4;
  uint64_t v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(VUIActionUpdateMusic *)self itemID];
    int v10 = 134218242;
    v11 = self;
    __int16 v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIActionUpdateMusic::(%p) perform action, itemId: %@", (uint8_t *)&v10, 0x16u);
  }
  v8 = +[VUIInterfaceFactory sharedInstance];
  objc_super v9 = [v8 musicManager];
  [v9 addSongToMusicWithSongId:self->_itemID isExplicit:self->_isExplicit];

  v5[2](v5, 1);
}

- (BOOL)isAccountRequired
{
  return 1;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (void)setIsExplicit:(BOOL)a3
{
  self->_isExplicit = a3;
}

- (void).cxx_destruct
{
}

@end