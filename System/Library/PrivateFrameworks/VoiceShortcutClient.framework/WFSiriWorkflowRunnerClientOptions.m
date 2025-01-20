@interface WFSiriWorkflowRunnerClientOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)disableSiriBehavior;
- (BOOL)isOwnedByCurrentUser;
- (NSArray)airPlayRouteIDs;
- (NSString)originatingDeviceIDSIdentifier;
- (NSString)originatingDeviceRapportEffectiveIdentifier;
- (NSString)originatingDeviceRapportMediaSystemIdentifier;
- (WFSiriWorkflowRunnerClientOptions)initWithAirPlayRouteIDs:(id)a3 executionContext:(int64_t)a4 originatingDeviceIDSIdentifier:(id)a5 originatingDeviceRapportEffectiveIdentifier:(id)a6 originatingDeviceRapportMediaSystemIdentifier:(id)a7 isOwnedByCurrentUser:(BOOL)a8;
- (WFSiriWorkflowRunnerClientOptions)initWithAirPlayRouteIDs:(id)a3 executionContext:(int64_t)a4 originatingDeviceIDSIdentifier:(id)a5 originatingDeviceRapportEffectiveIdentifier:(id)a6 originatingDeviceRapportMediaSystemIdentifier:(id)a7 isOwnedByCurrentUser:(BOOL)a8 disableSiriBehavior:(BOOL)a9;
- (WFSiriWorkflowRunnerClientOptions)initWithCoder:(id)a3;
- (int64_t)currentDeviceIdiom;
- (int64_t)executionContext;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentDeviceIdiom:(int64_t)a3;
@end

@implementation WFSiriWorkflowRunnerClientOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingDeviceRapportMediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_originatingDeviceRapportEffectiveIdentifier, 0);
  objc_storeStrong((id *)&self->_originatingDeviceIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_airPlayRouteIDs, 0);
}

- (BOOL)disableSiriBehavior
{
  return self->_disableSiriBehavior;
}

- (void)setCurrentDeviceIdiom:(int64_t)a3
{
  self->_currentDeviceIdiom = a3;
}

- (int64_t)currentDeviceIdiom
{
  return self->_currentDeviceIdiom;
}

- (BOOL)isOwnedByCurrentUser
{
  return self->_isOwnedByCurrentUser;
}

- (NSString)originatingDeviceRapportMediaSystemIdentifier
{
  return self->_originatingDeviceRapportMediaSystemIdentifier;
}

- (NSString)originatingDeviceRapportEffectiveIdentifier
{
  return self->_originatingDeviceRapportEffectiveIdentifier;
}

- (NSString)originatingDeviceIDSIdentifier
{
  return self->_originatingDeviceIDSIdentifier;
}

- (int64_t)executionContext
{
  return self->_executionContext;
}

- (NSArray)airPlayRouteIDs
{
  return self->_airPlayRouteIDs;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(WFSiriWorkflowRunnerClientOptions *)self airPlayRouteIDs];
  [v8 encodeObject:v4 forKey:@"airPlayRouteIDs"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[WFSiriWorkflowRunnerClientOptions executionContext](self, "executionContext"), @"executionContext");
  v5 = [(WFSiriWorkflowRunnerClientOptions *)self originatingDeviceIDSIdentifier];
  [v8 encodeObject:v5 forKey:@"originatingDeviceIDSIdentifier"];

  v6 = [(WFSiriWorkflowRunnerClientOptions *)self originatingDeviceRapportEffectiveIdentifier];
  [v8 encodeObject:v6 forKey:@"originatingDeviceRapportEffectiveIdentifier"];

  v7 = [(WFSiriWorkflowRunnerClientOptions *)self originatingDeviceRapportMediaSystemIdentifier];
  [v8 encodeObject:v7 forKey:@"originatingDeviceRapportMediaSystemIdentifier"];

  objc_msgSend(v8, "encodeBool:forKey:", -[WFSiriWorkflowRunnerClientOptions isOwnedByCurrentUser](self, "isOwnedByCurrentUser"), @"isOwnedByCurrentUser");
  objc_msgSend(v8, "encodeInteger:forKey:", -[WFSiriWorkflowRunnerClientOptions currentDeviceIdiom](self, "currentDeviceIdiom"), @"currentDeviceIdiom");
  objc_msgSend(v8, "encodeBool:forKey:", -[WFSiriWorkflowRunnerClientOptions disableSiriBehavior](self, "disableSiriBehavior"), @"disableSiriBehavior");
}

- (WFSiriWorkflowRunnerClientOptions)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"airPlayRouteIDs"];

  uint64_t v9 = [v5 decodeIntegerForKey:@"executionContext"];
  v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"originatingDeviceIDSIdentifier"];
  v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"originatingDeviceRapportEffectiveIdentifier"];
  v12 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"originatingDeviceRapportMediaSystemIdentifier"];
  uint64_t v13 = [v5 decodeBoolForKey:@"isOwnedByCurrentUser"];
  uint64_t v14 = [v5 decodeIntegerForKey:@"currentDeviceIdiom"];
  char v15 = [v5 decodeBoolForKey:@"disableSiriBehavior"];

  LOBYTE(v18) = v15;
  v16 = [(WFSiriWorkflowRunnerClientOptions *)self initWithAirPlayRouteIDs:v8 executionContext:v9 originatingDeviceIDSIdentifier:v10 originatingDeviceRapportEffectiveIdentifier:v11 originatingDeviceRapportMediaSystemIdentifier:v12 isOwnedByCurrentUser:v13 disableSiriBehavior:v18];
  [(WFSiriWorkflowRunnerClientOptions *)v16 setCurrentDeviceIdiom:v14];

  return v16;
}

- (WFSiriWorkflowRunnerClientOptions)initWithAirPlayRouteIDs:(id)a3 executionContext:(int64_t)a4 originatingDeviceIDSIdentifier:(id)a5 originatingDeviceRapportEffectiveIdentifier:(id)a6 originatingDeviceRapportMediaSystemIdentifier:(id)a7 isOwnedByCurrentUser:(BOOL)a8 disableSiriBehavior:(BOOL)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v30.receiver = self;
  v30.super_class = (Class)WFSiriWorkflowRunnerClientOptions;
  v19 = [(WFSiriWorkflowRunnerClientOptions *)&v30 init];
  if (v19)
  {
    uint64_t v20 = [v15 copy];
    airPlayRouteIDs = v19->_airPlayRouteIDs;
    v19->_airPlayRouteIDs = (NSArray *)v20;

    v19->_executionContext = a4;
    uint64_t v22 = [v16 copy];
    originatingDeviceIDSIdentifier = v19->_originatingDeviceIDSIdentifier;
    v19->_originatingDeviceIDSIdentifier = (NSString *)v22;

    uint64_t v24 = [v17 copy];
    originatingDeviceRapportEffectiveIdentifier = v19->_originatingDeviceRapportEffectiveIdentifier;
    v19->_originatingDeviceRapportEffectiveIdentifier = (NSString *)v24;

    uint64_t v26 = [v18 copy];
    originatingDeviceRapportMediaSystemIdentifier = v19->_originatingDeviceRapportMediaSystemIdentifier;
    v19->_originatingDeviceRapportMediaSystemIdentifier = (NSString *)v26;

    v19->_isOwnedByCurrentUser = a8;
    v19->_currentDeviceIdiom = 0;
    v19->_disableSiriBehavior = a9;
    v28 = v19;
  }

  return v19;
}

- (WFSiriWorkflowRunnerClientOptions)initWithAirPlayRouteIDs:(id)a3 executionContext:(int64_t)a4 originatingDeviceIDSIdentifier:(id)a5 originatingDeviceRapportEffectiveIdentifier:(id)a6 originatingDeviceRapportMediaSystemIdentifier:(id)a7 isOwnedByCurrentUser:(BOOL)a8
{
  LOBYTE(v9) = 0;
  return [(WFSiriWorkflowRunnerClientOptions *)self initWithAirPlayRouteIDs:a3 executionContext:a4 originatingDeviceIDSIdentifier:a5 originatingDeviceRapportEffectiveIdentifier:a6 originatingDeviceRapportMediaSystemIdentifier:a7 isOwnedByCurrentUser:a8 disableSiriBehavior:v9];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end