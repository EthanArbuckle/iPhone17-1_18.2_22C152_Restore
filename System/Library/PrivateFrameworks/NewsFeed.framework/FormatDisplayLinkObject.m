@interface FormatDisplayLinkObject
- (_TtC8NewsFeed23FormatDisplayLinkObject)init;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKeyPath:(id)a4;
@end

@implementation FormatDisplayLinkObject

- (void)setValue:(id)a3 forKey:(id)a4
{
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
}

- (id)valueForKey:(id)a3
{
  return sub_1C10815BC(self, (uint64_t)a2, (uint64_t)a3, 0);
}

- (id)valueForKeyPath:(id)a3
{
  return sub_1C10815BC(self, (uint64_t)a2, (uint64_t)a3, 1);
}

- (_TtC8NewsFeed23FormatDisplayLinkObject)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed23FormatDisplayLinkObject_storage) = (Class)MEMORY[0x1E4FBC868];
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(FormatDisplayLinkObject *)&v5 init];
}

- (void).cxx_destruct
{
}

@end