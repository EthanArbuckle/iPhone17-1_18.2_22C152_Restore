@interface MFMailboxFilterPickerCheckmarkCell
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation MFMailboxFilterPickerCheckmarkCell

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFMailboxFilterPickerCheckmarkCell;
  [(MFMailboxFilterPickerCheckmarkCell *)&v7 setSelected:a3 animated:a4];
  if (v4) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 0;
  }
  [(MFMailboxFilterPickerCheckmarkCell *)self setAccessoryType:v6];
}

@end