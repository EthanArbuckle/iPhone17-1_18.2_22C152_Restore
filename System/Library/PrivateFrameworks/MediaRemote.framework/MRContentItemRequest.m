@interface MRContentItemRequest
+ (BOOL)supportsSecureCoding;
- (MRContentItem)item;
- (MRContentItemRequest)initWithCoder:(id)a3;
- (MRContentItemRequest)initWithItem:(id)a3 request:(id)a4;
- (MRPlaybackQueueRequest)request;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setItem:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation MRContentItemRequest

- (MRContentItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

- (MRContentItemRequest)initWithItem:(id)a3 request:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MRContentItemRequest;
  v8 = [(MRContentItemRequest *)&v18 init];
  if (v8)
  {
    if (v6)
    {
      if (v7)
      {
LABEL_4:
        uint64_t v9 = [v7 copy];
        request = v8->_request;
        v8->_request = (MRPlaybackQueueRequest *)v9;

        v11 = (MRContentItem *)MRContentItemCreateFromRequest(v6, v8->_request);
        item = v8->_item;
        v8->_item = v11;

        goto LABEL_5;
      }
    }
    else
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      v15 = [NSString stringWithUTF8String:"-[MRContentItemRequest initWithItem:request:]"];
      [v14 handleFailureInFunction:v15, @"MRContentItemRequest.m", 25, @"Invalid parameter not satisfying: %@", @"item" file lineNumber description];

      if (v7) {
        goto LABEL_4;
      }
    }
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = [NSString stringWithUTF8String:"-[MRContentItemRequest initWithItem:request:]"];
    [v16 handleFailureInFunction:v17, @"MRContentItemRequest.m", 26, @"Invalid parameter not satisfying: %@", @"request" file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v8;
}

- (void)setItem:(id)a3
{
  self->_item = (MRContentItem *)MRContentItemCreateMergedItem(self->_item, a3);

  MEMORY[0x1F41817F8]();
}

- (void)setRequest:(id)a3
{
}

- (MRContentItemRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MRContentItemRequest;
  v5 = [(MRContentItemRequest *)&v21 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"1"];
    if (!v6)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      v14 = [NSString stringWithUTF8String:"-[MRContentItemRequest initWithCoder:]"];
      [v13 handleFailureInFunction:v14, @"MRContentItemRequest.m", 55, @"Invalid parameter not satisfying: %@", @"itemData" file lineNumber description];
    }
    uint64_t v7 = MRContentItemCreateFromExternalRepresentation(*MEMORY[0x1E4F1CF80], (uint64_t)v6);
    item = v5->_item;
    v5->_item = (MRContentItem *)v7;

    if (!v5->_item)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      v16 = [NSString stringWithUTF8String:"-[MRContentItemRequest initWithCoder:]"];
      [v15 handleFailureInFunction:v16, @"MRContentItemRequest.m", 58, @"Invalid parameter not satisfying: %@", @"_item" file lineNumber description];
    }
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"0"];
    if (!v9)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_super v18 = [NSString stringWithUTF8String:"-[MRContentItemRequest initWithCoder:]"];
      [v17 handleFailureInFunction:v18, @"MRContentItemRequest.m", 61, @"Invalid parameter not satisfying: %@", @"requestData" file lineNumber description];
    }
    v10 = [[MRPlaybackQueueRequest alloc] initWithData:v9];
    request = v5->_request;
    v5->_request = v10;

    if (!v5->_request)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      v20 = [NSString stringWithUTF8String:"-[MRContentItemRequest initWithCoder:]"];
      [v19 handleFailureInFunction:v20, @"MRContentItemRequest.m", 64, @"Invalid parameter not satisfying: %@", @"_request" file lineNumber description];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  item = self->_item;
  id v5 = a3;
  id ExternalRepresentation = (id)MRContentItemCreateExternalRepresentation(0, item);
  [v5 encodeObject:ExternalRepresentation forKey:@"1"];
  id v6 = [(MRPlaybackQueueRequest *)self->_request data];
  [v5 encodeObject:v6 forKey:@"0"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p {\n  request = %@  item = %@}", objc_opt_class(), self, self->_request, self->_item];
}

- (MRPlaybackQueueRequest)request
{
  return self->_request;
}

@end