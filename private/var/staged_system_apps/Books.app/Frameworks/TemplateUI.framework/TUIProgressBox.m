@interface TUIProgressBox
- (BOOL)paused;
- (Class)layoutClass;
- (NSString)progressId;
- (NSString)progressMode;
- (TUIDynamicProgress)dynamicProgress;
- (TUIProgressBox)init;
- (UIColor)color;
- (double)progress;
- (void)setColor:(id)a3;
- (void)setDynamicProgress:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setProgress:(double)a3;
- (void)setProgressId:(id)a3;
- (void)setProgressMode:(id)a3;
@end

@implementation TUIProgressBox

- (TUIProgressBox)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUIProgressBox;
  result = [(TUIBox *)&v3 init];
  if (result) {
    result->super._storage._data = TUIProgressBoxStorageDataset | 1;
  }
  return result;
}

- (void)setProgressId:(id)a3
{
}

- (NSString)progressId
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0x2Cu);

  return (NSString *)ObjectForKey;
}

- (void)setProgressMode:(id)a3
{
}

- (NSString)progressMode
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0x21u);

  return (NSString *)ObjectForKey;
}

- (void)setPaused:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super._flags + 6);
  uint64_t v4 = 0x100000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->super._flags | ((unint64_t)(*((unsigned __int16 *)&self->super._flags + 2) | (v3 << 16)) << 32)) & 0xFFFFFFFEFFFFFFFFLL | v4;
  *(_DWORD *)&self->super._flags = self->super._flags;
  *((unsigned char *)&self->super._flags + 6) = v3;
  *((_WORD *)&self->super._flags + 2) = WORD2(v5);
}

- (BOOL)paused
{
  return *((_WORD *)&self->super._flags + 2) & 1;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (TUIDynamicProgress)dynamicProgress
{
  return self->_dynamicProgress;
}

- (void)setDynamicProgress:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_dynamicProgress, 0);
}

@end