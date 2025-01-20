@interface ICASMoveCheckedItemsToBottomSwitchSetting
- (ICASMoveCheckedItemsToBottomSwitchSetting)initWithMoveCheckedItemsToBottomSwitchSetting:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)moveCheckedItemsToBottomSwitchSetting;
@end

@implementation ICASMoveCheckedItemsToBottomSwitchSetting

- (ICASMoveCheckedItemsToBottomSwitchSetting)initWithMoveCheckedItemsToBottomSwitchSetting:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASMoveCheckedItemsToBottomSwitchSetting;
  result = [(ICASMoveCheckedItemsToBottomSwitchSetting *)&v5 init];
  if (result) {
    result->_moveCheckedItemsToBottomSwitchSetting = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASMoveCheckedItemsToBottomSwitchSetting *)self moveCheckedItemsToBottomSwitchSetting];
  v4 = @"unknown";
  if (v3 == 1) {
    v4 = @"automatic";
  }
  if (v3 == 2) {
    return @"manual";
  }
  else {
    return v4;
  }
}

- (int64_t)moveCheckedItemsToBottomSwitchSetting
{
  return self->_moveCheckedItemsToBottomSwitchSetting;
}

@end