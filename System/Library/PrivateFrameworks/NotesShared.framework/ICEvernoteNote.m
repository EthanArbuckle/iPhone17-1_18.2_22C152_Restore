@interface ICEvernoteNote
+ (BOOL)supportsSecureCoding;
- (ICEvernoteNote)init;
- (ICEvernoteNote)initWithCoder:(id)a3;
- (NSArray)resources;
- (NSArray)tags;
- (NSDate)created;
- (NSDate)updated;
- (NSString)content;
- (NSString)title;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setContent:(id)a3;
- (void)setCreated:(id)a3;
- (void)setResources:(id)a3;
- (void)setTags:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUpdated:(id)a3;
@end

@implementation ICEvernoteNote

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICEvernoteNote)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICEvernoteNote;
  v2 = [(ICEvernoteNote *)&v8 init];
  v3 = v2;
  if (v2)
  {
    tags = v2->_tags;
    v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_tags = (NSArray *)MEMORY[0x1E4F1CBF0];

    resources = v3->_resources;
    v3->_resources = v5;
  }
  return v3;
}

- (ICEvernoteNote)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ICEvernoteNote;
  v5 = [(ICEvernoteNote *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"content"];
    content = v5->_content;
    v5->_content = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"created"];
    created = v5->_created;
    v5->_created = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updated"];
    updated = v5->_updated;
    v5->_updated = (NSDate *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"tags"];
    tags = v5->_tags;
    v5->_tags = (NSArray *)v17;

    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"resources"];
    resources = v5->_resources;
    v5->_resources = (NSArray *)v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ICEvernoteNote *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  uint64_t v6 = [(ICEvernoteNote *)self content];
  [v4 encodeObject:v6 forKey:@"content"];

  v7 = [(ICEvernoteNote *)self created];
  [v4 encodeObject:v7 forKey:@"created"];

  uint64_t v8 = [(ICEvernoteNote *)self updated];
  [v4 encodeObject:v8 forKey:@"updated"];

  v9 = [(ICEvernoteNote *)self tags];
  [v4 encodeObject:v9 forKey:@"tags"];

  id v10 = [(ICEvernoteNote *)self resources];
  [v4 encodeObject:v10 forKey:@"resources"];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(ICEvernoteNote *)self title];
  v5 = [(ICEvernoteNote *)self content];
  uint64_t v6 = [v3 stringWithFormat:@"title: %@\ncontent: %@", v4, v5];

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (NSDate)created
{
  return self->_created;
}

- (void)setCreated:(id)a3
{
}

- (NSDate)updated
{
  return self->_updated;
}

- (void)setUpdated:(id)a3
{
}

- (NSArray)tags
{
  return self->_tags;
}

- (void)setTags:(id)a3
{
}

- (NSArray)resources
{
  return self->_resources;
}

- (void)setResources:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end