@interface MNGuidanceJunctionViewInfo
+ (BOOL)supportsSecureCoding;
- (MNGuidanceJunctionViewInfo)initWithCoder:(id)a3;
- (MNGuidanceJunctionViewInfo)initWithID:(id)a3 images:(id)a4;
- (NSArray)images;
- (NSUUID)uniqueID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MNGuidanceJunctionViewInfo

- (MNGuidanceJunctionViewInfo)initWithID:(id)a3 images:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MNGuidanceJunctionViewInfo;
  v9 = [(MNGuidanceJunctionViewInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uniqueID, a3);
    objc_storeStrong((id *)&v10->_images, a4);
  }

  return v10;
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = self->_images;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v3, "appendFormat:", @"%ld", objc_msgSend(v9, "imageID"));
        v10 = [(NSArray *)self->_images lastObject];

        if (v10 != v9) {
          [v3 appendString:@", "];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v11 = [NSString stringWithFormat:@"UUID: %@, Image IDs: %@", self->_uniqueID, v3, (void)v13];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNGuidanceJunctionViewInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MNGuidanceJunctionViewInfo;
  uint64_t v5 = [(MNGuidanceJunctionViewInfo *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_uniqueID"];
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSUUID *)v6;

    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_images"];
    images = v5->_images;
    v5->_images = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uniqueID = self->_uniqueID;
  id v5 = a3;
  [v5 encodeObject:uniqueID forKey:@"_uniqueID"];
  [v5 encodeObject:self->_images forKey:@"_images"];
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (NSArray)images
{
  return self->_images;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end