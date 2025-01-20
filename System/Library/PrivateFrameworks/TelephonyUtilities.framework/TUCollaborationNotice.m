@interface TUCollaborationNotice
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCollaborationNotice:(id)a3;
- (NSString)description;
- (NSUUID)UUID;
- (SWCollaborationHighlight)collaboration;
- (TUCollaborationNotice)initWithCoder:(id)a3;
- (TUCollaborationNotice)initWithUUID:(id)a3;
- (int64_t)sessionEventType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCollaboration:(id)a3;
- (void)setSessionEventType:(int64_t)a3;
@end

@implementation TUCollaborationNotice

- (TUCollaborationNotice)initWithUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUCollaborationNotice;
  v6 = [(TUCollaborationNotice *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_UUID, a3);
  }

  return v7;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(TUCollaborationNotice *)self UUID];
  [v3 appendFormat:@" UUID=%@", v4];

  objc_msgSend(v3, "appendFormat:", @" sessionEventType=%ld", -[TUCollaborationNotice sessionEventType](self, "sessionEventType"));
  id v5 = [(TUCollaborationNotice *)self collaboration];
  [v3 appendFormat:@" collaboration=%@", v5];

  [v3 appendString:@">"];
  v6 = (void *)[v3 copy];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUCollaborationNotice *)self isEqualToCollaborationNotice:v4];

  return v5;
}

- (BOOL)isEqualToCollaborationNotice:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUCollaborationNotice *)self UUID];
  v6 = [v4 UUID];
  if ([v5 isEqual:v6]
    && (int64_t v7 = [(TUCollaborationNotice *)self sessionEventType],
        v7 == [v4 sessionEventType]))
  {
    v8 = [(TUCollaborationNotice *)self collaboration];
    objc_super v9 = [v4 collaboration];
    char v10 = [v8 isEqual:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  int64_t v3 = [(TUCollaborationNotice *)self sessionEventType];
  id v4 = [(TUCollaborationNotice *)self collaboration];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUCollaborationNotice)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_UUID);
  int64_t v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  v8 = [(TUCollaborationNotice *)self initWithUUID:v7];
  if (v8)
  {
    objc_super v9 = NSStringFromSelector(sel_sessionEventType);
    v8->_sessionEventType = [v4 decodeIntegerForKey:v9];

    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2050000000;
    char v10 = (void *)getSWCollaborationHighlightClass_softClass_0;
    uint64_t v21 = getSWCollaborationHighlightClass_softClass_0;
    if (!getSWCollaborationHighlightClass_softClass_0)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __getSWCollaborationHighlightClass_block_invoke_0;
      v17[3] = &unk_1E58E5F90;
      v17[4] = &v18;
      __getSWCollaborationHighlightClass_block_invoke_0((uint64_t)v17);
      char v10 = (void *)v19[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v18, 8);
    uint64_t v12 = objc_opt_class();
    v13 = NSStringFromSelector(sel_collaboration);
    uint64_t v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
    collaboration = v8->_collaboration;
    v8->_collaboration = (SWCollaborationHighlight *)v14;
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(TUCollaborationNotice *)self sessionEventType];
  v6 = NSStringFromSelector(sel_sessionEventType);
  [v4 encodeInteger:v5 forKey:v6];

  int64_t v7 = [(TUCollaborationNotice *)self UUID];
  v8 = NSStringFromSelector(sel_UUID);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(TUCollaborationNotice *)self collaboration];
  objc_super v9 = NSStringFromSelector(sel_collaboration);
  [v4 encodeObject:v10 forKey:v9];
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (int64_t)sessionEventType
{
  return self->_sessionEventType;
}

- (void)setSessionEventType:(int64_t)a3
{
  self->_sessionEventType = a3;
}

- (SWCollaborationHighlight)collaboration
{
  return self->_collaboration;
}

- (void)setCollaboration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaboration, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end