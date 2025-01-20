@interface LaunchConfiguration
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)identifier;
- (_TtC8Stickers19LaunchConfiguration)init;
- (_TtC8Stickers19LaunchConfiguration)initWithCoder:(id)a3;
- (double)creationDate;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDate:(double)a3;
@end

@implementation LaunchConfiguration

- (NSString)identifier
{
  if (*(void *)&self->sectionType[OBJC_IVAR____TtC8Stickers19LaunchConfiguration_identifier])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_25E4258C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (double)creationDate
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Stickers19LaunchConfiguration_creationDate);
}

- (void)setCreationDate:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Stickers19LaunchConfiguration_creationDate) = a3;
}

- (_TtC8Stickers19LaunchConfiguration)init
{
  return (_TtC8Stickers19LaunchConfiguration *)LaunchConfiguration.init()();
}

+ (BOOL)supportsSecureCoding
{
  return byte_26A6EDB70;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_26A6EDB70 = a3;
}

- (_TtC8Stickers19LaunchConfiguration)initWithCoder:(id)a3
{
  return (_TtC8Stickers19LaunchConfiguration *)LaunchConfiguration.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25E40E460(v4);
}

- (void).cxx_destruct
{
}

@end