@interface WFContextualMediaDescriptor
+ (BOOL)supportsSecureCoding;
- (INMediaItem)mediaItem;
- (INPlayMediaIntent)intent;
- (NSData)artwork;
- (WFContextualMediaDescriptor)initWithCoder:(id)a3;
- (WFContextualMediaDescriptor)initWithMediaItem:(id)a3 serializedRepresentation:(id)a4;
- (WFContextualMediaDescriptor)initWithPlayMediaIntent:(id)a3 artwork:(id)a4;
- (WFPropertyListObject)serializedRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFContextualMediaDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedRepresentation, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

- (WFPropertyListObject)serializedRepresentation
{
  return self->_serializedRepresentation;
}

- (INMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (NSData)artwork
{
  return self->_artwork;
}

- (INPlayMediaIntent)intent
{
  return self->_intent;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFContextualMediaDescriptor *)self mediaItem];
  [v4 encodeObject:v5 forKey:@"mediaItem"];

  v6 = [(WFContextualMediaDescriptor *)self serializedRepresentation];
  [v4 encodeObject:v6 forKey:@"serializedRepresentation"];

  v7 = [(WFContextualMediaDescriptor *)self intent];
  [v4 encodeObject:v7 forKey:@"intent"];

  id v8 = [(WFContextualMediaDescriptor *)self artwork];
  [v4 encodeObject:v8 forKey:@"artwork"];
}

- (WFContextualMediaDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WFContextualMediaDescriptor;
  v5 = [(WFContextualMediaDescriptor *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaItem"];
    mediaItem = v5->_mediaItem;
    v5->_mediaItem = (INMediaItem *)v6;

    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"serializedRepresentation"];
    serializedRepresentation = v5->_serializedRepresentation;
    v5->_serializedRepresentation = (WFPropertyListObject *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent"];
    intent = v5->_intent;
    v5->_intent = (INPlayMediaIntent *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"artwork"];
    artwork = v5->_artwork;
    v5->_artwork = (NSData *)v19;

    v21 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [WFContextualMediaDescriptor alloc];
  v5 = [(WFContextualMediaDescriptor *)self mediaItem];
  uint64_t v6 = [(WFContextualMediaDescriptor *)self serializedRepresentation];
  v7 = [(WFContextualMediaDescriptor *)v4 initWithMediaItem:v5 serializedRepresentation:v6];

  return v7;
}

- (WFContextualMediaDescriptor)initWithPlayMediaIntent:(id)a3 artwork:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFContextualMediaDescriptor;
  id v8 = [(WFContextualMediaDescriptor *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    intent = v8->_intent;
    v8->_intent = (INPlayMediaIntent *)v9;

    objc_storeStrong((id *)&v8->_artwork, a4);
    uint64_t v11 = v8;
  }

  return v8;
}

- (WFContextualMediaDescriptor)initWithMediaItem:(id)a3 serializedRepresentation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFContextualMediaDescriptor;
  uint64_t v9 = [(WFContextualMediaDescriptor *)&v13 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaItem, a3);
    objc_storeStrong((id *)&v10->_serializedRepresentation, a4);
    uint64_t v11 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end