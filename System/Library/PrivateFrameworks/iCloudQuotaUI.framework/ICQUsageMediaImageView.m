@interface ICQUsageMediaImageView
- (ICQUsageMediaImageView)init;
- (void)sizeToFit;
@end

@implementation ICQUsageMediaImageView

- (ICQUsageMediaImageView)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICQUsageMediaImageView;
  v2 = [(ICQUsageMediaImageView *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F825C8] blackColor];
    [(ICQUsageMediaImageView *)v2 setBackgroundColor:v3];

    [(ICQUsageMediaImageView *)v2 setContentMode:1];
  }
  return v2;
}

- (void)sizeToFit
{
  [(ICQUsageMediaImageView *)self frame];
  -[ICQUsageMediaImageView setFrame:](self, "setFrame:");
}

@end