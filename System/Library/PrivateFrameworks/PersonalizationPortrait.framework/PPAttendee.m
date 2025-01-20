@interface PPAttendee
+ (BOOL)supportsSecureCoding;
- (BOOL)isCurrentUser;
- (BOOL)isEqual:(id)a3;
- (NSString)emailAddress;
- (NSString)name;
- (NSURL)url;
- (PPAttendee)initWithCoder:(id)a3;
- (PPAttendee)initWithEKParticipant:(id)a3;
- (PPAttendee)initWithName:(id)a3 emailAddress:(id)a4 url:(id)a5 isCurrentUser:(BOOL)a6 status:(unsigned __int8)a7;
- (PPAttendee)initWithName:(id)a3 emailAddress:(id)a4 urlString:(id)a5 isCurrentUser:(BOOL)a6 status:(unsigned __int8)a7;
- (id)_plist;
- (id)description;
- (id)initWithIndex:(void *)a3 inBackingPlists:;
- (unint64_t)hash;
- (unsigned)status;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPAttendee

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPAttendee *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (self)
    {
      v7 = [(NSArray *)self->_backingPlists objectAtIndexedSubscript:self->_indexInBackingPlists];
      v8 = [v6[1] objectAtIndexedSubscript:v6[2]];
      LOBYTE(self) = [v7 isEqual:v8];
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (unint64_t)hash
{
  v2 = -[PPAttendee _plist]((uint64_t)self);
  v3 = [v2 objectForKeyedSubscript:@"nam"];
  uint64_t v4 = [v3 hash];

  v5 = [v2 objectForKeyedSubscript:@"eml"];
  uint64_t v6 = [v5 hash] - v4 + 32 * v4;

  v7 = [v2 objectForKeyedSubscript:@"url"];
  uint64_t v8 = [v7 hash] - v6 + 32 * v6;

  v9 = [v2 objectForKeyedSubscript:@"icu"];
  uint64_t v10 = [v9 hash] - v8 + 32 * v8;

  v11 = [v2 objectForKeyedSubscript:@"sta"];
  unint64_t v12 = [v11 hash] - v10 + 32 * v10;

  return v12;
}

- (id)_plist
{
  if (a1)
  {
    a1 = [*(id *)(a1 + 8) objectAtIndexedSubscript:*(void *)(a1 + 16)];
    uint64_t v1 = vars8;
  }
  return (id)a1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(PPAttendee *)self name];
  [v7 encodeObject:v4 forKey:@"nam"];

  v5 = [(PPAttendee *)self emailAddress];
  [v7 encodeObject:v5 forKey:@"eml"];

  uint64_t v6 = [(PPAttendee *)self url];
  [v7 encodeObject:v6 forKey:@"url"];

  objc_msgSend(v7, "encodeBool:forKey:", -[PPAttendee isCurrentUser](self, "isCurrentUser"), @"icu");
  objc_msgSend(v7, "encodeInt32:forKey:", -[PPAttendee status](self, "status"), @"sta");
}

- (PPAttendee)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x192F97350]();
  uint64_t v6 = (void *)MEMORY[0x192F97350]();
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  uint64_t v8 = (void *)MEMORY[0x192F97350]();
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"url"];
  if (v10)
  {
    v11 = [v4 decodeObjectOfClasses:v7 forKey:@"nam"];
    unint64_t v12 = [v4 decodeObjectOfClasses:v7 forKey:@"eml"];
    self = -[PPAttendee initWithName:emailAddress:url:isCurrentUser:status:](self, "initWithName:emailAddress:url:isCurrentUser:status:", v11, v12, v10, [v4 decodeBoolForKey:@"icu"], objc_msgSend(v4, "decodeInt32ForKey:", @"sta"));

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(PPAttendee *)self name];
  v5 = [(PPAttendee *)self emailAddress];
  uint64_t v6 = (void *)[v3 initWithFormat:@"<PPAttendee n:'%@' e:'%@'>", v4, v5];

  return v6;
}

- (unsigned)status
{
  v2 = -[PPAttendee _plist]((uint64_t)self);
  id v3 = [v2 objectForKeyedSubscript:@"sta"];
  unsigned __int8 v4 = [v3 unsignedCharValue];

  return v4;
}

- (BOOL)isCurrentUser
{
  v2 = -[PPAttendee _plist]((uint64_t)self);
  id v3 = [v2 objectForKeyedSubscript:@"icu"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSURL)url
{
  id v4 = objc_alloc(MEMORY[0x1E4F1CB10]);
  v5 = -[PPAttendee _plist]((uint64_t)self);
  uint64_t v6 = [v5 objectForKeyedSubscript:@"url"];
  id v7 = (void *)[v4 initWithString:v6];

  if (!v7)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PPEvent.m", 149, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];
  }
  return (NSURL *)v7;
}

- (NSString)emailAddress
{
  v2 = -[PPAttendee _plist]((uint64_t)self);
  id v3 = [v2 objectForKeyedSubscript:@"eml"];

  return (NSString *)v3;
}

- (NSString)name
{
  v2 = -[PPAttendee _plist]((uint64_t)self);
  id v3 = [v2 objectForKeyedSubscript:@"nam"];

  return (NSString *)v3;
}

- (PPAttendee)initWithEKParticipant:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x192F97350]();
  uint64_t v6 = [v4 name];
  id v7 = [v4 emailAddress];
  uint64_t v8 = [v7 lowercaseString];
  v9 = [v4 URL];
  uint64_t v10 = -[PPAttendee initWithName:emailAddress:url:isCurrentUser:status:](self, "initWithName:emailAddress:url:isCurrentUser:status:", v6, v8, v9, [v4 isCurrentUser], objc_msgSend(v4, "participantStatus"));

  return v10;
}

- (PPAttendee)initWithName:(id)a3 emailAddress:(id)a4 urlString:(id)a5 isCurrentUser:(BOOL)a6 status:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  BOOL v8 = a6;
  v37[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v34 = a5;
  bzero(v36, 0x400uLL);
  bzero(v35, 0x400uLL);
  if (v12)
  {
    v36[0] = @"nam";
    v35[0] = v12;
    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (v13)
  {
    v15 = (void *)v36[v14];
    v36[v14] = @"eml";

    objc_storeStrong(&v35[v14++], a4);
  }
  uint64_t v16 = v14;
  v17 = (void *)v36[v14];
  v36[v14] = @"url";

  objc_storeStrong(&v35[v14], a5);
  v18 = (void *)v36[v14 + 1];
  v36[v16 + 1] = @"icu";

  uint64_t v19 = [NSNumber numberWithBool:v8];
  id v20 = v35[v14 + 1];
  v35[v16 + 1] = (id)v19;

  uint64_t v21 = 8 * v14 + 16;
  v22 = *(void **)((char *)v36 + v21);
  v36[v16 + 2] = @"sta";

  uint64_t v23 = [NSNumber numberWithUnsignedChar:v7];
  v24 = *(id *)((char *)v35 + v21);
  *(id *)((char *)v35 + v21) = (id)v23;

  v25 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v35 forKeys:v36 count:v14 + 3];
  v26 = v25;
  if (self)
  {
    v37[0] = v25;
    v27 = (void *)MEMORY[0x1E4F1C978];
    id v28 = v25;
    v29 = [v27 arrayWithObjects:v37 count:1];

    self = -[PPAttendee initWithIndex:inBackingPlists:]((id *)&self->super.isa, 0, v29);
  }
  v30 = self;

  for (uint64_t i = 127; i != -1; --i)
  for (uint64_t j = 127; j != -1; --j)

  return v30;
}

- (id)initWithIndex:(void *)a3 inBackingPlists:
{
  id v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)PPAttendee;
    uint64_t v7 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      v7[2] = a2;
      objc_storeStrong(v7 + 1, a3);
    }
  }

  return a1;
}

- (PPAttendee)initWithName:(id)a3 emailAddress:(id)a4 url:(id)a5 isCurrentUser:(BOOL)a6 status:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [a5 absoluteString];
  v15 = [(PPAttendee *)self initWithName:v13 emailAddress:v12 urlString:v14 isCurrentUser:v8 status:v7];

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end