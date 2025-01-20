@interface UITableView
- (void)setEditorBackgroundColor:(id)a3;
@end

@implementation UITableView

- (void)setEditorBackgroundColor:(id)a3
{
  id v4 = a3;
  if ((id)[(UITableView *)self style] == (id)1) {
    [(UITableView *)self setBackgroundColor:v4];
  }
}

@end