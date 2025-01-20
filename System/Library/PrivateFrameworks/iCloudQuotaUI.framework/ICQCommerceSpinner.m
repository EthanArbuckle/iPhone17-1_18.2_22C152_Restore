@interface ICQCommerceSpinner
- (id)specifiers;
- (void)loadView;
@end

@implementation ICQCommerceSpinner

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)ICQCommerceSpinner;
  [(ICQCommerceSpinner *)&v7 loadView];
  v3 = [ICQCommerceSpinnerView alloc];
  v4 = [(ICQCommerceSpinner *)self view];
  [v4 frame];
  v5 = -[ICQCommerceSpinnerView initWithFrame:](v3, "initWithFrame:");

  [(ICQCommerceSpinnerView *)v5 setAutoresizingMask:18];
  v6 = [(ICQCommerceSpinner *)self view];
  [v6 addSubview:v5];
}

- (id)specifiers
{
  return (id)MEMORY[0x263EFFA68];
}

@end