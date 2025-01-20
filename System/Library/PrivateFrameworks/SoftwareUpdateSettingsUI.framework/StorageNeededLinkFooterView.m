@interface StorageNeededLinkFooterView
- (StorageNeededLinkFooterView)initWithSpecifier:(id)a3;
- (void)setText:(id)a3;
@end

@implementation StorageNeededLinkFooterView

- (StorageNeededLinkFooterView)initWithSpecifier:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)StorageNeededLinkFooterView;
  v9 = [(PSFooterHyperlinkView *)&v7 initWithSpecifier:location[0]];
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    id v6 = (id)[location[0] propertyForKey:*MEMORY[0x263F600F8]];
    if ([v6 length]) {
      [(StorageNeededLinkFooterView *)v9 setText:v6];
    }
    objc_storeStrong(&v6, 0);
  }
  v5 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)setText:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] length])
  {
    id v6 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v10 = (id)[v6 localizedStringForKey:@"LEARN_MORE_LINK" value:&stru_26DCD7690 table:@"Software Update"];

    id v3 = (id)[NSString stringWithFormat:@"%@  %@", location[0], v10];
    id v4 = location[0];
    location[0] = v3;

    *(void *)&long long v9 = [location[0] rangeOfString:v10];
    *((void *)&v9 + 1) = v5;
    long long v8 = v9;
    -[PSFooterHyperlinkView setLinkRange:](v12, "setLinkRange:", (void)v9, v5);
    objc_storeStrong(&v10, 0);
  }
  v7.receiver = v12;
  v7.super_class = (Class)StorageNeededLinkFooterView;
  [(PSFooterHyperlinkView *)&v7 setText:location[0]];
  objc_storeStrong(location, 0);
}

@end