@interface VUGallery.Bookmark
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtCC19VisualUnderstanding9VUGallery8Bookmark)init;
- (_TtCC19VisualUnderstanding9VUGallery8Bookmark)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VUGallery.Bookmark

+ (BOOL)supportsSecureCoding
{
  return byte_26A90FCE0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_26A90FCE0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_26104DA28(v4);
}

- (_TtCC19VisualUnderstanding9VUGallery8Bookmark)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtCC19VisualUnderstanding9VUGallery8Bookmark *)sub_261069FE8();

  return v4;
}

- (id)copyWithZone:(void *)a3
{
  id v3 = self;
  sub_26104DC50(v6);

  __swift_project_boxed_opaque_existential_1Tm(v6, v6[3]);
  id v4 = (void *)sub_26111F3F8();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v6);
  return v4;
}

- (_TtCC19VisualUnderstanding9VUGallery8Bookmark)init
{
  result = (_TtCC19VisualUnderstanding9VUGallery8Bookmark *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end