@interface SiriNLUSELFRequestLinkData
- (NSString)resultCandidateId;
- (NSString)targetName;
- (NSUUID)targetUUID;
- (SIRINLUEXTERNALUUID)nlId;
- (SIRINLUEXTERNALUUID)trpId;
- (unint64_t)splitCount;
- (void)setNlId:(id)a3;
- (void)setResultCandidateId:(id)a3;
- (void)setSplitCount:(unint64_t)a3;
- (void)setTargetName:(id)a3;
- (void)setTargetUUID:(id)a3;
- (void)setTrpId:(id)a3;
@end

@implementation SiriNLUSELFRequestLinkData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetUUID, 0);
  objc_storeStrong((id *)&self->_targetName, 0);
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_trpId, 0);
  objc_storeStrong((id *)&self->_nlId, 0);
}

- (void)setTargetUUID:(id)a3
{
}

- (NSUUID)targetUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTargetName:(id)a3
{
}

- (NSString)targetName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSplitCount:(unint64_t)a3
{
  self->_splitCount = a3;
}

- (unint64_t)splitCount
{
  return self->_splitCount;
}

- (void)setResultCandidateId:(id)a3
{
}

- (NSString)resultCandidateId
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTrpId:(id)a3
{
}

- (SIRINLUEXTERNALUUID)trpId
{
  return (SIRINLUEXTERNALUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNlId:(id)a3
{
}

- (SIRINLUEXTERNALUUID)nlId
{
  return (SIRINLUEXTERNALUUID *)objc_getProperty(self, a2, 8, 1);
}

@end