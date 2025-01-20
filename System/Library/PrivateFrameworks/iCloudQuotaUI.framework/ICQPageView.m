@interface ICQPageView
- (id)horizontalConstraintsForView:(id)a3 margin:(double)a4;
@end

@implementation ICQPageView

- (id)horizontalConstraintsForView:(id)a3 margin:(double)a4
{
  v15[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 isHidden])
  {
    v7 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v8 = [v6 leftAnchor];
    v9 = [(ICQPageView *)self leftAnchor];
    v10 = [v8 constraintEqualToAnchor:v9 constant:a4];
    v15[0] = v10;
    v11 = [v6 rightAnchor];
    v12 = [(ICQPageView *)self rightAnchor];
    v13 = [v11 constraintEqualToAnchor:v12 constant:-a4];
    v15[1] = v13;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  }
  return v7;
}

@end