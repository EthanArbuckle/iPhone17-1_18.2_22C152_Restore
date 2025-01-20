@interface MailMailboxGroupedPickerTableCell
- (BOOL)alwaysDisplayAsTopLevel;
- (double)fontSize;
- (id)nameForMailbox:(id)a3;
- (int)levelForMailbox:(id)a3;
- (void)setAlwaysDisplayAsTopLevel:(BOOL)a3;
@end

@implementation MailMailboxGroupedPickerTableCell

- (double)fontSize
{
  return 0.0;
}

- (int)levelForMailbox:(id)a3
{
  id v4 = a3;
  if ([v4 mailboxType]
    || [(MailMailboxGroupedPickerTableCell *)self alwaysDisplayAsTopLevel])
  {
    int v5 = 0;
  }
  else
  {
    v7 = +[MailChangeManager sharedChangeManager];
    int v5 = [v7 levelForMailbox:v4];
  }
  return v5;
}

- (id)nameForMailbox:(id)a3
{
  id v3 = a3;
  if ([v3 mailboxType] == (id)7)
  {
    id v4 = +[MailChangeManager sharedChangeManager];
    [v4 displayNameUsingSpecialNamesForMailbox:v3];
  }
  else
  {
    id v4 = +[MailChangeManager sharedChangeManager];
    [v4 displayNameForMailbox:v3];
  int v5 = };

  return v5;
}

- (BOOL)alwaysDisplayAsTopLevel
{
  return *((unsigned char *)&self->super + 9);
}

- (void)setAlwaysDisplayAsTopLevel:(BOOL)a3
{
  *((unsigned char *)&self->super + 9) = a3;
}

@end