@interface StarRow
- (NSString)maximumContentSizeCategory;
- (NSString)minimumContentSizeCategory;
- (_TtC8AppStoreP33_4D569A3E6303747AA734C2D941AA4EED7StarRow)initWithCoder:(id)a3;
- (_TtC8AppStoreP33_4D569A3E6303747AA734C2D941AA4EED7StarRow)initWithFrame:(CGRect)a3;
- (void)setMaximumContentSizeCategory:(id)a3;
- (void)setMinimumContentSizeCategory:(id)a3;
@end

@implementation StarRow

- (NSString)maximumContentSizeCategory
{
  return (NSString *)sub_1003E0F90(self, (uint64_t)a2, (SEL *)&selRef_maximumContentSizeCategory);
}

- (void)setMaximumContentSizeCategory:(id)a3
{
}

- (NSString)minimumContentSizeCategory
{
  return (NSString *)sub_1003E0F90(self, (uint64_t)a2, (SEL *)&selRef_minimumContentSizeCategory);
}

- (void)setMinimumContentSizeCategory:(id)a3
{
}

- (_TtC8AppStoreP33_4D569A3E6303747AA734C2D941AA4EED7StarRow)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003E207C();
}

- (_TtC8AppStoreP33_4D569A3E6303747AA734C2D941AA4EED7StarRow)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_4D569A3E6303747AA734C2D941AA4EED7StarRow_starColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_4D569A3E6303747AA734C2D941AA4EED7StarRow_starImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStoreP33_4D569A3E6303747AA734C2D941AA4EED7StarRow_starLayer);
}

@end