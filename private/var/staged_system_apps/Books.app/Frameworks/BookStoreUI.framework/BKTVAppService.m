@interface BKTVAppService
+ (BKTVAppService)shared;
- (BKTVAppService)init;
- (id)fetchTVApp:(id)a3;
@end

@implementation BKTVAppService

+ (BKTVAppService)shared
{
  if (qword_3C6550 != -1) {
    swift_once();
  }
  v2 = (void *)qword_3C8970;

  return (BKTVAppService *)v2;
}

- (id)fetchTVApp:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_969E4(v4);
  v7 = v6;

  return v7;
}

- (BKTVAppService)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKTVAppService____lazy_storage___tvMapping) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(BKTVAppService *)&v5 init];
}

- (void).cxx_destruct
{
}

@end