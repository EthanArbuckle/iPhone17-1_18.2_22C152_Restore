@interface GKChallengeInvite
+ (BOOL)supportsSecureCoding;
- (GKChallengeInternal)challenge;
- (GKChallengeInvite)initWithChallenge:(id)a3;
- (GKChallengeInvite)initWithCoder:(id)a3;
- (GKPlayerInternal)issuingPlayer;
- (GKPlayerInternal)receivingPlayer;
- (NSDictionary)pushDescriptor;
- (NSString)challengeID;
- (NSString)gameTitle;
- (NSString)goalText;
- (NSString)resolvedBundleID;
- (id)challengeInternalObject;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)loadDetailsWithHandler:(id)a3;
- (void)loadGoalTextForGameDescriptor:(id)a3 handler:(id)a4;
- (void)setChallenge:(id)a3;
- (void)setChallengeID:(id)a3;
- (void)setGameTitle:(id)a3;
- (void)setGoalText:(id)a3;
- (void)setIssuingPlayer:(id)a3;
- (void)setPushDescriptor:(id)a3;
- (void)setReceivingPlayer:(id)a3;
- (void)setResolvedBundleID:(id)a3;
@end

@implementation GKChallengeInvite

- (GKChallengeInvite)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GKChallengeInvite;
  v5 = [(GKChallengeInvite *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receivingPlayer"];
    receivingPlayer = v5->_receivingPlayer;
    v5->_receivingPlayer = (GKPlayerInternal *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"issuingPlayer"];
    issuingPlayer = v5->_issuingPlayer;
    v5->_issuingPlayer = (GKPlayerInternal *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"challenge"];
    challenge = v5->_challenge;
    v5->_challenge = (GKChallengeInternal *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"goalText"];
    goalText = v5->_goalText;
    v5->_goalText = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gameTitle"];
    gameTitle = v5->_gameTitle;
    v5->_gameTitle = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resolvedBundleID"];
    resolvedBundleID = v5->_resolvedBundleID;
    v5->_resolvedBundleID = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"challengeID"];
    challengeID = v5->_challengeID;
    v5->_challengeID = (NSString *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  receivingPlayer = self->_receivingPlayer;
  id v5 = a3;
  [v5 encodeObject:receivingPlayer forKey:@"receivingPlayer"];
  [v5 encodeObject:self->_issuingPlayer forKey:@"issuingPlayer"];
  [v5 encodeObject:self->_challenge forKey:@"challenge"];
  [v5 encodeObject:self->_goalText forKey:@"goalText"];
  [v5 encodeObject:self->_gameTitle forKey:@"gameTitle"];
  [v5 encodeObject:self->_resolvedBundleID forKey:@"resolvedBundleID"];
  [v5 encodeObject:self->_challengeID forKey:@"challengeID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v2 = [(GKChallengeInvite *)self pushDescriptor];
  v3 = +[NSString stringWithFormat:@"GKChallengeInvite: %@", v2];

  return v3;
}

- (id)challengeInternalObject
{
  return 0;
}

- (GKChallengeInvite)initWithChallenge:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKChallengeInvite;
  uint64_t v6 = [(GKChallengeInvite *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_challenge, a3);
  }

  return v7;
}

- (void)loadDetailsWithHandler:(id)a3
{
  id v23 = a3;
  id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKChallengeInvite.m", 101, "-[GKChallengeInvite loadDetailsWithHandler:]");
  id v5 = +[GKDispatchGroup dispatchGroupWithName:v4];

  uint64_t v6 = +[GKClientProxy gameCenterClient];
  v7 = [(GKChallengeInvite *)self challenge];
  uint64_t v8 = [v7 receivingPlayer];
  objc_super v9 = [v8 playerID];
  v32[0] = v9;
  uint64_t v10 = [(GKChallengeInvite *)self challenge];
  v11 = [v10 issuingPlayer];
  uint64_t v12 = [v11 playerID];
  v32[1] = v12;
  v13 = +[NSArray arrayWithObjects:v32 count:2];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000FCAEC;
  v28[3] = &unk_1002D3980;
  id v14 = v6;
  id v29 = v14;
  id v30 = v13;
  v31 = self;
  id v15 = v13;
  [v5 perform:v28];
  uint64_t v16 = [(GKChallengeInternal *)self->_challenge bundleID];
  [(GKChallengeInvite *)self setResolvedBundleID:v16];

  v17 = [(GKChallengeInternal *)self->_challenge game];
  uint64_t v18 = [v17 name];
  [(GKChallengeInvite *)self setGameTitle:v18];

  v19 = [v14 replyQueue];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000FCC60;
  v24[3] = &unk_1002D7E80;
  v24[4] = self;
  id v25 = v17;
  id v26 = v14;
  id v27 = v23;
  id v20 = v14;
  id v21 = v23;
  id v22 = v17;
  [v5 notifyOnQueue:v19 block:v24];
}

- (void)loadGoalTextForGameDescriptor:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = dispatch_group_create();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_1000FD294;
  void v28[4] = sub_1000FD2A4;
  id v29 = 0;
  objc_super v9 = +[GKClientProxy gameCenterClient];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = self->_challenge;
    dispatch_group_enter(v8);
    v11 = +[GKService serviceWithTransport:0 forClient:v9 localPlayer:0];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000FD2AC;
    v25[3] = &unk_1002DA4E8;
    uint64_t v12 = v10;
    id v26 = v12;
    v27[1] = v28;
    v27[0] = v8;
    [v11 getAchievementDescriptionsForGameDescriptor:v6 handler:v25];
    v13 = (id *)&v26;
    id v14 = (id *)v27;
LABEL_5:

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = self->_challenge;
    dispatch_group_enter(v8);
    v11 = +[GKService serviceWithTransport:0 forClient:v9 localPlayer:0];
    receivingPlayer = self->_receivingPlayer;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000FD470;
    v22[3] = &unk_1002DA4E8;
    uint64_t v12 = v15;
    id v23 = v12;
    v24[1] = v28;
    v24[0] = v8;
    [v11 getLeaderboardsForGameDescriptor:v6 player:receivingPlayer setIdentifier:0 handler:v22];
    v13 = (id *)&v23;
    id v14 = (id *)v24;
    goto LABEL_5;
  }
LABEL_6:
  v17 = [v9 replyQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FD694;
  block[3] = &unk_1002DA510;
  id v20 = v7;
  id v21 = v28;
  id v18 = v7;
  dispatch_group_notify(v8, v17, block);

  _Block_object_dispose(v28, 8);
}

- (GKChallengeInternal)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (GKPlayerInternal)receivingPlayer
{
  return self->_receivingPlayer;
}

- (void)setReceivingPlayer:(id)a3
{
}

- (GKPlayerInternal)issuingPlayer
{
  return self->_issuingPlayer;
}

- (void)setIssuingPlayer:(id)a3
{
}

- (NSString)goalText
{
  return self->_goalText;
}

- (void)setGoalText:(id)a3
{
}

- (NSString)gameTitle
{
  return self->_gameTitle;
}

- (void)setGameTitle:(id)a3
{
}

- (NSString)resolvedBundleID
{
  return self->_resolvedBundleID;
}

- (void)setResolvedBundleID:(id)a3
{
}

- (NSString)challengeID
{
  return self->_challengeID;
}

- (void)setChallengeID:(id)a3
{
}

- (NSDictionary)pushDescriptor
{
  return self->_pushDescriptor;
}

- (void)setPushDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedBundleID, 0);
  objc_storeStrong((id *)&self->_gameTitle, 0);
  objc_storeStrong((id *)&self->_pushDescriptor, 0);
  objc_storeStrong((id *)&self->_goalText, 0);
  objc_storeStrong((id *)&self->_issuingPlayer, 0);
  objc_storeStrong((id *)&self->_receivingPlayer, 0);
  objc_storeStrong((id *)&self->_challenge, 0);

  objc_storeStrong((id *)&self->_challengeID, 0);
}

@end