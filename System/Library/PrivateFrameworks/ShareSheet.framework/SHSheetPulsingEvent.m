@interface SHSheetPulsingEvent
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)startPulsingEventWithActivityUUID:(id)a3 localizedTitle:(id)a4;
+ (id)stopPulsingEventWithActivityUUID:(id)a3;
- (BOOL)isPulsing;
- (NSString)localizedTitle;
- (NSUUID)activityUUID;
- (SHSheetPulsingEvent)initWithBSXPCCoder:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setActivityUUID:(id)a3;
- (void)setIsPulsing:(BOOL)a3;
- (void)setLocalizedTitle:(id)a3;
@end

@implementation SHSheetPulsingEvent

+ (id)startPulsingEventWithActivityUUID:(id)a3 localizedTitle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(SHSheetPulsingEvent);
  [(SHSheetPulsingEvent *)v7 setActivityUUID:v6];

  [(SHSheetPulsingEvent *)v7 setLocalizedTitle:v5];
  [(SHSheetPulsingEvent *)v7 setIsPulsing:1];
  return v7;
}

+ (id)stopPulsingEventWithActivityUUID:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SHSheetPulsingEvent);
  [(SHSheetPulsingEvent *)v4 setActivityUUID:v3];

  [(SHSheetPulsingEvent *)v4 setIsPulsing:0];
  return v4;
}

- (SHSheetPulsingEvent)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHSheetPulsingEvent;
  id v5 = [(SHSheetPulsingEvent *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityUUID"];
    [(SHSheetPulsingEvent *)v5 setActivityUUID:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
    [(SHSheetPulsingEvent *)v5 setLocalizedTitle:v7];

    -[SHSheetPulsingEvent setIsPulsing:](v5, "setIsPulsing:", [v4 decodeBoolForKey:@"isPulsing"]);
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(SHSheetPulsingEvent *)self activityUUID];
  [v6 encodeObject:v4 forKey:@"activityUUID"];

  id v5 = [(SHSheetPulsingEvent *)self localizedTitle];
  [v6 encodeObject:v5 forKey:@"localizedTitle"];

  objc_msgSend(v6, "encodeBool:forKey:", -[SHSheetPulsingEvent isPulsing](self, "isPulsing"), @"isPulsing");
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (NSUUID)activityUUID
{
  return self->_activityUUID;
}

- (void)setActivityUUID:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (BOOL)isPulsing
{
  return self->_isPulsing;
}

- (void)setIsPulsing:(BOOL)a3
{
  self->_isPulsing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_activityUUID, 0);
}

@end