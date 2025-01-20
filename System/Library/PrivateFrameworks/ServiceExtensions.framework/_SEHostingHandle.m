@interface _SEHostingHandle
+ (BOOL)supportsSecureCoding;
- (_SEHostingHandle)init;
- (_SEHostingHandle)initWithCoder:(id)a3;
- (id)initFromXPCRepresentation:(id)a3;
- (id)xpcRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SEHostingHandle

- (_SEHostingHandle)init
{
}

- (id)initFromXPCRepresentation:(id)a3
{
  return _SEHostingHandle.init(from:)(a3);
}

- (id)xpcRepresentation
{
  v2 = self;
  xpc_object_t empty = xpc_dictionary_create_empty();
  uint64_t v4 = *(unsigned int *)((char *)&v2->super.isa + OBJC_IVAR____SEHostingHandle_pid);
  if ((v4 & 0x80000000) != 0)
  {
    id result = (id)sub_25C221C18();
    __break(1u);
  }
  else
  {
    v5 = empty;
    xpc_dictionary_set_uint64(empty, "pid", v4);
    xpc_dictionary_set_uint64(v5, "cid", *(unsigned int *)((char *)&v2->super.isa + OBJC_IVAR____SEHostingHandle_contextID));

    return v5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SEHostingHandle)initWithCoder:(id)a3
{
  return (_SEHostingHandle *)_SEHostingHandle.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(unsigned int *)((char *)&self->super.isa + OBJC_IVAR____SEHostingHandle_pid);
  id v5 = a3;
  v6 = self;
  v7 = (void *)sub_25C2219D8();
  objc_msgSend(v5, sel_encodeInt32_forKey_, v4, v7);

  uint64_t v8 = *(unsigned int *)((char *)&v6->super.isa + OBJC_IVAR____SEHostingHandle_contextID);
  id v9 = (id)sub_25C2219D8();
  objc_msgSend(v5, sel_encodeInt32_forKey_, v8, v9);
}

@end