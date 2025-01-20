@interface DocumentXPCEnvelope
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSData)_metadata;
- (NSFileHandle)_fileHandle;
- (NSURL)_url;
- (_TtC4Sage19DocumentXPCEnvelope)init;
- (_TtC4Sage19DocumentXPCEnvelope)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)set_fileHandle:(id)a3;
- (void)set_metadata:(id)a3;
- (void)set_url:(id)a3;
@end

@implementation DocumentXPCEnvelope

- (NSURL)_url
{
  uint64_t v2 = sub_25B9EC270();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B972814((uint64_t)v5);
  v6 = (void *)sub_25B9EC230();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSURL *)v6;
}

- (void)set_url:(id)a3
{
  uint64_t v4 = sub_25B9EC270();
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B9EC250();
  v7 = self;
  sub_25B97292C((uint64_t)v6);
}

- (NSFileHandle)_fileHandle
{
  id v2 = sub_25B9729EC();
  return (NSFileHandle *)v2;
}

- (void)set_fileHandle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_25B972A58((uint64_t)v4);
}

- (NSData)_metadata
{
  return (NSData *)sub_25B97457C((uint64_t)self, (uint64_t)a2, sub_25B972A84);
}

- (void)set_metadata:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return static DocumentXPCEnvelope.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (_TtC4Sage19DocumentXPCEnvelope)initWithCoder:(id)a3
{
  id v3 = a3;
  DocumentXPCEnvelope.init(coder:)();
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  DocumentXPCEnvelope.encode(with:)((NSCoder)v4);
}

- (_TtC4Sage19DocumentXPCEnvelope)init
{
}

- (void).cxx_destruct
{
  sub_25B9EC270();
  sub_25B95097C();
  sub_25B959038();
  v3();

  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Sage19DocumentXPCEnvelope__metadata);
  unint64_t v5 = *(void *)&self->_anon_0[OBJC_IVAR____TtC4Sage19DocumentXPCEnvelope__metadata];
  sub_25B955A74(v4, v5);
}

@end