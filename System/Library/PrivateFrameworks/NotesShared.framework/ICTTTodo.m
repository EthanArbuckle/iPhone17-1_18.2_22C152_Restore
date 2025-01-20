@interface ICTTTodo
- (BOOL)done;
- (BOOL)isEqual:(id)a3;
- (ICTTTodo)init;
- (ICTTTodo)initWithArchive:(const void *)a3;
- (ICTTTodo)initWithData:(id)a3;
- (ICTTTodo)initWithIdentifier:(id)a3 done:(BOOL)a4;
- (ICTTTodo)todoWithDone:(BOOL)a3;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)serialize;
- (unint64_t)hash;
- (void)saveToArchive:(void *)a3;
@end

@implementation ICTTTodo

- (ICTTTodo)init
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = [(ICTTTodo *)self initWithIdentifier:v3 done:0];

  return v4;
}

- (ICTTTodo)initWithIdentifier:(id)a3 done:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICTTTodo;
  v8 = [(ICTTTodo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_uuid, a3);
    v9->_done = a4;
  }

  return v9;
}

- (ICTTTodo)todoWithDone:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ICTTTodo *)self done] == a3)
  {
    id v7 = self;
  }
  else
  {
    v5 = [ICTTTodo alloc];
    v6 = [(ICTTTodo *)self uuid];
    id v7 = [(ICTTTodo *)v5 initWithIdentifier:v6 done:v3];
  }
  return v7;
}

- (id)description
{
  BOOL v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(ICTTTodo *)self uuid];
  id v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICTTTodo done](self, "done"));
  v8 = [v3 stringWithFormat:@"<%@: %p, uuid: %@, done: %@>", v5, self, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    id v4 = a3;
    objc_opt_class();
    v5 = ICDynamicCast();

    v6 = [(ICTTTodo *)self uuid];
    id v7 = [v5 uuid];
    if ([v6 isEqual:v7])
    {
      BOOL v8 = [(ICTTTodo *)self done];
      int v9 = v8 ^ [v5 done] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(ICTTTodo *)self done];
  id v4 = [(ICTTTodo *)self uuid];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = +[ICTTTodo allocWithZone:](ICTTTodo, "allocWithZone:");
  v6 = (void *)[(NSUUID *)self->_uuid copyWithZone:a3];
  id v7 = [(ICTTTodo *)v5 initWithIdentifier:v6 done:self->_done];

  return v7;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)done
{
  return self->_done;
}

- (void).cxx_destruct
{
}

- (ICTTTodo)initWithData:(id)a3
{
  id v4 = a3;
  topotext::Todo::Todo((topotext::Todo *)v11);
  id v5 = v4;
  v6 = (char *)[v5 bytes];
  int v7 = ICTTBoundedCheckedCastNSUIntegerToUInt32([v5 length]);
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v11, v6, v7))
  {
    self = [(ICTTTodo *)self initWithArchive:v11];
    BOOL v8 = self;
  }
  else
  {
    int v9 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICTTTodo(ICTTTodoPersistenceAdditions) initWithData:](v9);
    }

    BOOL v8 = 0;
  }
  topotext::Todo::~Todo((topotext::Todo *)v11);

  return v8;
}

- (ICTTTodo)initWithArchive:(const void *)a3
{
  if ((~*((_DWORD *)a3 + 8) & 3) != 0)
  {
    BOOL v8 = 0;
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F29128]);
    v6 = (uint64_t *)*((void *)a3 + 5);
    if (*((char *)v6 + 23) < 0) {
      v6 = (uint64_t *)*v6;
    }
    int v7 = (void *)[v5 initWithUUIDBytes:v6];
    BOOL v8 = [[ICTTTodo alloc] initWithIdentifier:v7 done:*((unsigned __int8 *)a3 + 48)];
  }
  return v8;
}

- (void)saveToArchive:(void *)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(ICTTTodo *)self done];
  *((_DWORD *)a3 + 8) |= 2u;
  *((unsigned char *)a3 + 48) = v5;
  v7[0] = 0;
  v7[1] = 0;
  v6 = [(ICTTTodo *)self uuid];
  [v6 getUUIDBytes:v7];

  *((_DWORD *)a3 + 8) |= 1u;
  if (!google::protobuf::internal::empty_string_) {
    versioned_document::Version::SharedCtor();
  }
  if (*((void *)a3 + 5) == google::protobuf::internal::empty_string_) {
    operator new();
  }
  MEMORY[0x1C877D5C0]();
}

- (id)serialize
{
  topotext::Todo::Todo((topotext::Todo *)v7);
  [(ICTTTodo *)self saveToArchive:v7];
  id v3 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(int)topotext::Todo::ByteSize((topotext::Todo *)v7)];
  id v4 = (void *)[v3 mutableBytes];
  int v5 = ICTTBoundedCheckedCastNSUIntegerToUInt32([v3 length]);
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v7, v4, v5);
  topotext::Todo::~Todo((topotext::Todo *)v7);
  return v3;
}

@end