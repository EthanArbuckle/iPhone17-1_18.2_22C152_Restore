@interface MailStatusIndeterminateView
- (void)updateWithStatusInfo:(id)a3;
@end

@implementation MailStatusIndeterminateView

- (void)updateWithStatusInfo:(id)a3
{
  id v5 = [a3 status];
  id v4 = [objc_alloc((Class)NSAttributedString) initWithString:v5];
  [(MailStatusLabelView *)self setPrimaryLabelText:v4];
}

@end