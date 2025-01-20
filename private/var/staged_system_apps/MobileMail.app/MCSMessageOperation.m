@interface MCSMessageOperation
- (BOOL)commitToMessages:(id)a3 failures:(id)a4 newMessages:(id)a5;
- (BOOL)willFlag;
- (BOOL)willMarkRead;
- (BOOL)willMarkUnread;
- (BOOL)willUnflag;
- (id)localizedErrorDescriptionForMessageCount:(unint64_t)a3;
- (id)localizedErrorTitleForMessageCount:(unint64_t)a3;
- (id)localizedShortOperationDescription;
@end

@implementation MCSMessageOperation

- (BOOL)commitToMessages:(id)a3 failures:(id)a4 newMessages:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [(MCSMessageOperation *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MCSMessageOperation commitToMessages:failures:newMessages:]", "MCSMessageOperation.m", 17, "0");
}

- (BOOL)willMarkRead
{
}

- (BOOL)willMarkUnread
{
}

- (BOOL)willFlag
{
}

- (BOOL)willUnflag
{
}

- (id)localizedErrorDescriptionForMessageCount:(unint64_t)a3
{
}

- (id)localizedErrorTitleForMessageCount:(unint64_t)a3
{
}

- (id)localizedShortOperationDescription
{
}

@end