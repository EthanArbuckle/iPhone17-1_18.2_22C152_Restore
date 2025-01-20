@interface _SUAutoInstallOperationModel
+ (BOOL)supportsSecureCoding;
- (BOOL)waitingUntilDownloadComplete;
- (NSUUID)id;
- (SUAutoInstallForecast)forecast;
- (_SUAutoInstallOperationModel)init;
- (_SUAutoInstallOperationModel)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)agreementStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setAgreementStatus:(int)a3;
- (void)setForecast:(id)a3;
- (void)setId:(id)a3;
- (void)setWaitingUntilDownloadComplete:(BOOL)a3;
@end

@implementation _SUAutoInstallOperationModel

- (_SUAutoInstallOperationModel)init
{
  v7.receiver = self;
  v7.super_class = (Class)_SUAutoInstallOperationModel;
  v2 = [(_SUAutoInstallOperationModel *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_agreementStatus = 0;
    uint64_t v4 = [MEMORY[0x263F08C38] UUID];
    id = v3->_id;
    v3->_id = (NSUUID *)v4;
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  forecast = self->_forecast;
  uint64_t agreementStatus = self->_agreementStatus;
  uint64_t v6 = [(NSUUID *)self->_id UUIDString];
  objc_super v7 = (void *)v6;
  if (self->_waitingUntilDownloadComplete) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  v9 = [v3 stringWithFormat:@"forecast: %@\n             agreementStatus: %d\n             id: %@             waitingUntilDownloadComplete: %@", forecast, agreementStatus, v6, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SUAutoInstallOperationModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SUAutoInstallOperationModel;
  v5 = [(_SUAutoInstallOperationModel *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"forecast"];
    [(_SUAutoInstallOperationModel *)v5 setForecast:v6];

    -[_SUAutoInstallOperationModel setAgreementStatus:](v5, "setAgreementStatus:", [v4 decodeIntForKey:@"agreementStatus"]);
    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    [(_SUAutoInstallOperationModel *)v5 setId:v7];

    -[_SUAutoInstallOperationModel setWaitingUntilDownloadComplete:](v5, "setWaitingUntilDownloadComplete:", [v4 decodeBoolForKey:@"waitingUntilDownloadComplete"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(_SUAutoInstallOperationModel *)self forecast];
  [v6 encodeObject:v4 forKey:@"forecast"];

  objc_msgSend(v6, "encodeInt:forKey:", -[_SUAutoInstallOperationModel agreementStatus](self, "agreementStatus"), @"agreementStatus");
  v5 = [(_SUAutoInstallOperationModel *)self id];
  [v6 encodeObject:v5 forKey:@"id"];

  objc_msgSend(v6, "encodeBool:forKey:", -[_SUAutoInstallOperationModel waitingUntilDownloadComplete](self, "waitingUntilDownloadComplete"), @"waitingUntilDownloadComplete");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(_SUAutoInstallOperationModel);
  v5 = [(_SUAutoInstallOperationModel *)self forecast];
  [(_SUAutoInstallOperationModel *)v4 setForecast:v5];

  [(_SUAutoInstallOperationModel *)v4 setAgreementStatus:[(_SUAutoInstallOperationModel *)self agreementStatus]];
  id v6 = [(_SUAutoInstallOperationModel *)self id];
  [(_SUAutoInstallOperationModel *)v4 setId:v6];

  [(_SUAutoInstallOperationModel *)v4 setWaitingUntilDownloadComplete:[(_SUAutoInstallOperationModel *)self waitingUntilDownloadComplete]];
  return v4;
}

- (SUAutoInstallForecast)forecast
{
  return self->_forecast;
}

- (void)setForecast:(id)a3
{
}

- (int)agreementStatus
{
  return self->_agreementStatus;
}

- (void)setAgreementStatus:(int)a3
{
  self->_uint64_t agreementStatus = a3;
}

- (NSUUID)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
}

- (BOOL)waitingUntilDownloadComplete
{
  return self->_waitingUntilDownloadComplete;
}

- (void)setWaitingUntilDownloadComplete:(BOOL)a3
{
  self->_waitingUntilDownloadComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forecast, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end