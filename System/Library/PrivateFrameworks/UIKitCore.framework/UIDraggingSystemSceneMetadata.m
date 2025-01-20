@interface UIDraggingSystemSceneMetadata
+ (BOOL)supportsSecureCoding;
- (NSString)activityType;
- (NSString)sceneIdentifier;
- (UIDraggingSystemSceneMetadata)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityType:(id)a3;
- (void)setSceneIdentifier:(id)a3;
@end

@implementation UIDraggingSystemSceneMetadata

- (UIDraggingSystemSceneMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIDraggingSystemSceneMetadata;
  v5 = [(UIDraggingSystemSceneMetadata *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityType"];
    activityType = v5->_activityType;
    v5->_activityType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sceneIdentifier"];
    sceneIdentifier = v5->_sceneIdentifier;
    v5->_sceneIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UIDraggingSystemSceneMetadata *)self activityType];
  [v4 encodeObject:v5 forKey:@"activityType"];

  id v6 = [(UIDraggingSystemSceneMetadata *)self sceneIdentifier];
  [v4 encodeObject:v6 forKey:@"sceneIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

@end