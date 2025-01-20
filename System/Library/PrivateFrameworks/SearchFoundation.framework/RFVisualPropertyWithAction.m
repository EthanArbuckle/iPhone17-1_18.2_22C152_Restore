@interface RFVisualPropertyWithAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFVisualPropertyWithAction)initWithCoder:(id)a3;
- (RFVisualPropertyWithAction)initWithProtobuf:(id)a3;
- (SFCommandButtonItem)commandItem;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCommandItem:(id)a3;
@end

@implementation RFVisualPropertyWithAction

- (void).cxx_destruct
{
}

- (void)setCommandItem:(id)a3
{
}

- (SFCommandButtonItem)commandItem
{
  return self->_commandItem;
}

- (unint64_t)hash
{
  v10.receiver = self;
  v10.super_class = (Class)RFVisualPropertyWithAction;
  unint64_t v3 = [(RFVisualProperty *)&v10 hash];
  v4 = [(RFVisualProperty *)self visual_elements];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = v5 ^ [(RFVisualProperty *)self is_safe_for_logging];
  v7 = [(RFVisualPropertyWithAction *)self commandItem];
  unint64_t v8 = v6 ^ [v7 hash] ^ v3;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (RFVisualPropertyWithAction *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(RFVisualPropertyWithAction *)v5 isMemberOfClass:objc_opt_class()])
    {
      v22.receiver = self;
      v22.super_class = (Class)RFVisualPropertyWithAction;
      if ([(RFVisualProperty *)&v22 isEqual:v5])
      {
        uint64_t v6 = v5;
        v7 = [(RFVisualProperty *)self visual_elements];
        unint64_t v8 = [(RFVisualProperty *)v6 visual_elements];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
LABEL_21:

          goto LABEL_22;
        }
        v9 = [(RFVisualProperty *)self visual_elements];
        if (v9)
        {
          objc_super v10 = [(RFVisualProperty *)self visual_elements];
          unint64_t v3 = [(RFVisualProperty *)v6 visual_elements];
          if (![v10 isEqual:v3])
          {
            char v11 = 0;
            goto LABEL_19;
          }
          v21 = v10;
        }
        BOOL v12 = [(RFVisualProperty *)self is_safe_for_logging];
        if (v12 == [(RFVisualProperty *)v6 is_safe_for_logging])
        {
          v13 = [(RFVisualPropertyWithAction *)self commandItem];
          v14 = [(RFVisualPropertyWithAction *)v6 commandItem];
          v15 = v14;
          if ((v13 == 0) != (v14 != 0))
          {
            uint64_t v16 = [(RFVisualPropertyWithAction *)self commandItem];
            if (v16)
            {
              v17 = (void *)v16;
              v20 = [(RFVisualPropertyWithAction *)self commandItem];
              v19 = [(RFVisualPropertyWithAction *)v6 commandItem];
              char v11 = [v20 isEqual:v19];
            }
            else
            {

              char v11 = 1;
            }
LABEL_18:
            objc_super v10 = v21;
            if (!v9)
            {
LABEL_20:

              goto LABEL_21;
            }
LABEL_19:

            goto LABEL_20;
          }
        }
        char v11 = 0;
        goto LABEL_18;
      }
    }
    char v11 = 0;
  }
LABEL_22:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RFVisualPropertyWithAction;
  id v4 = [(RFVisualProperty *)&v10 copyWithZone:a3];
  uint64_t v5 = [(RFVisualProperty *)self visual_elements];
  uint64_t v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setVisual_elements:", v6);

  objc_msgSend(v4, "setIs_safe_for_logging:", -[RFVisualProperty is_safe_for_logging](self, "is_safe_for_logging"));
  v7 = [(RFVisualPropertyWithAction *)self commandItem];
  unint64_t v8 = (void *)[v7 copy];
  [v4 setCommandItem:v8];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFVisualPropertyWithAction alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFVisualPropertyWithAction *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFVisualPropertyWithAction alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFVisualPropertyWithAction *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBRFVisualPropertyWithAction alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBRFVisualPropertyWithAction *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFVisualPropertyWithAction)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBRFVisualPropertyWithAction alloc] initWithData:v5];
  v7 = [(RFVisualPropertyWithAction *)self initWithProtobuf:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFVisualPropertyWithAction)initWithProtobuf:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RFVisualPropertyWithAction;
  uint64_t v5 = [(RFVisualPropertyWithAction *)&v24 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "visual_elements");
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    unint64_t v8 = objc_msgSend(v4, "visual_elements", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[RFVisualElement alloc] initWithProtobuf:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v10);
    }

    [(RFVisualProperty *)v5 setVisual_elements:v7];
    if (objc_msgSend(v4, "is_safe_for_logging")) {
      -[RFVisualProperty setIs_safe_for_logging:](v5, "setIs_safe_for_logging:", objc_msgSend(v4, "is_safe_for_logging"));
    }
    v14 = [v4 commandItem];

    if (v14)
    {
      v15 = [SFCommandButtonItem alloc];
      uint64_t v16 = [v4 commandItem];
      v17 = [(SFCommandButtonItem *)v15 initWithProtobuf:v16];
      [(RFVisualPropertyWithAction *)v5 setCommandItem:v17];
    }
    v18 = v5;
  }
  return v5;
}

@end