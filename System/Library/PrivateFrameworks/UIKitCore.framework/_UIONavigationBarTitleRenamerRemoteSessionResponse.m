@interface _UIONavigationBarTitleRenamerRemoteSessionResponse
+ (id)shouldEndEditingResponse:(BOOL)a3;
+ (id)successResponseForAction:(int)a3;
+ (id)willBeginRenamingResponseWithText:(id)a3 selectedRange:(_NSRange)a4;
- (BOOL)shouldEndEditing;
- (NSString)text;
- (_NSRange)selectedRange;
- (int)_action;
@end

@implementation _UIONavigationBarTitleRenamerRemoteSessionResponse

+ (id)willBeginRenamingResponseWithText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v8 = objc_opt_new();
  [v8 setObject:&unk_1ED3F6FF0 forSetting:0];
  [v8 setObject:v7 forSetting:1];

  v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", location, length);
  [v8 setObject:v9 forSetting:2];

  v10 = (void *)[objc_alloc((Class)a1) initWithInfo:v8 error:0];
  return v10;
}

+ (id)shouldEndEditingResponse:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_opt_new();
  [v5 setObject:&unk_1ED3F7008 forSetting:0];
  [v5 setFlag:v3 forSetting:3];
  v6 = (void *)[objc_alloc((Class)a1) initWithInfo:v5 error:0];

  return v6;
}

+ (id)successResponseForAction:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = objc_opt_new();
  v6 = [NSNumber numberWithUnsignedInt:v3];
  [v5 setObject:v6 forSetting:0];

  id v7 = (void *)[objc_alloc((Class)a1) initWithInfo:v5 error:0];
  return v7;
}

- (int)_action
{
  v2 = [(_UIONavigationBarTitleRenamerRemoteSessionResponse *)self info];
  uint64_t v3 = [v2 objectForSetting:0];
  int v4 = [v3 intValue];

  return v4;
}

- (NSString)text
{
  if ([(_UIONavigationBarTitleRenamerRemoteSessionResponse *)self _action]
    && [(_UIONavigationBarTitleRenamerRemoteSessionResponse *)self _action] != 1)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"_UIONavigationBarTitleRenamerRemoteSessionAction.m", 259, @"%@ is not supported for action of kind %d", v8, -[_UIONavigationBarTitleRenamerRemoteSessionResponse _action](self, "_action") object file lineNumber description];
  }
  int v4 = [(_UIONavigationBarTitleRenamerRemoteSessionResponse *)self info];
  v5 = [v4 objectForSetting:1];

  return (NSString *)v5;
}

- (_NSRange)selectedRange
{
  if ([(_UIONavigationBarTitleRenamerRemoteSessionResponse *)self _action])
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = NSStringFromSelector(a2);
    [v11 handleFailureInMethod:a2, self, @"_UIONavigationBarTitleRenamerRemoteSessionAction.m", 265, @"%@ is not supported for action of kind %d", v12, -[_UIONavigationBarTitleRenamerRemoteSessionResponse _action](self, "_action") object file lineNumber description];
  }
  int v4 = [(_UIONavigationBarTitleRenamerRemoteSessionResponse *)self info];
  v5 = [v4 objectForSetting:2];
  uint64_t v6 = [v5 rangeValue];
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (BOOL)shouldEndEditing
{
  if ([(_UIONavigationBarTitleRenamerRemoteSessionResponse *)self _action] != 1)
  {
    NSUInteger v7 = [MEMORY[0x1E4F28B00] currentHandler];
    NSUInteger v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"_UIONavigationBarTitleRenamerRemoteSessionAction.m", 271, @"%@ is not supported for action of kind %d", v8, -[_UIONavigationBarTitleRenamerRemoteSessionResponse _action](self, "_action") object file lineNumber description];
  }
  int v4 = [(_UIONavigationBarTitleRenamerRemoteSessionResponse *)self info];
  BOOL v5 = [v4 flagForSetting:3] != 0;

  return v5;
}

@end