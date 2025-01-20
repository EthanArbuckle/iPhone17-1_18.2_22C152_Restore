@interface AssessmentPayloadRecord
- (AssessmentPayloadRecord)initWithObject:(id)a3;
- (BOOL)shouldSendOTD;
- (NSArray)bindingsToCompare;
- (NSDate)createdAt;
- (NSDictionary)bindingsRecords;
- (NSNumber)digestIndex;
- (NSNumber)refreshTTL;
- (NSString)assessment;
- (NSString)assessmentGUID;
- (NSString)assessmentGUIDSeeds;
- (NSString)encryptedAGUID;
- (NSString)encryptedTSID;
- (NSString)otdDestinationHost;
- (NSString)profileID;
- (NSString)trainingData;
- (NSString)trainingGUID;
- (NSString)trainingGUIDSeeds;
- (NSString)trainingSignalID;
- (NSString)workflowID;
@end

@implementation AssessmentPayloadRecord

- (AssessmentPayloadRecord)initWithObject:(id)a3
{
  id v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)AssessmentPayloadRecord;
  v5 = [(AssessmentPayloadRecord *)&v70 init];
  if (!v5) {
    goto LABEL_26;
  }
  v6 = [v4 workflowID];
  if (v6)
  {
    uint64_t v7 = [v4 createdAt];
    if (v7)
    {
      v8 = (void *)v7;
      uint64_t v9 = [v4 assessment];
      if (v9)
      {
        v10 = (void *)v9;
        uint64_t v11 = [v4 trainingData];
        if (v11)
        {
          v12 = (void *)v11;
          uint64_t v13 = [v4 trainingSignalID];
          if (v13)
          {
            v14 = (void *)v13;
            uint64_t v15 = [v4 assessmentGUID];
            if (v15)
            {
              v16 = (void *)v15;
              uint64_t v17 = [v4 assessmentGUIDSeeds];
              if (v17)
              {
                v18 = (void *)v17;
                uint64_t v19 = [v4 trainingData];
                if (v19)
                {
                  v20 = (void *)v19;
                  uint64_t v21 = [v4 trainingGUIDSeeds];
                  if (v21)
                  {
                    v69 = (void *)v21;
                    uint64_t v22 = [v4 digestIndex];
                    if (v22)
                    {
                      v68 = (void *)v22;
                      v23 = [v4 bindings];
                      if (v23)
                      {
                        id v66 = v23;
                        v24 = [v4 bindingsToCompare];
                        if (v24)
                        {
                          id v65 = v24;
                          v25 = [v4 encryptedTSID];
                          if (v25)
                          {
                            id v64 = v25;
                            v26 = [v4 encryptedAGUID];
                            if (v26)
                            {
                              v63 = v26;
                              v27 = [v4 profileID];
                              BOOL v67 = v27 != 0;

                              v26 = v63;
                            }
                            else
                            {
                              BOOL v67 = 0;
                            }

                            v25 = v64;
                          }
                          else
                          {
                            BOOL v67 = 0;
                          }

                          v24 = v65;
                        }
                        else
                        {
                          BOOL v67 = 0;
                        }

                        v23 = v66;
                      }
                      else
                      {
                        BOOL v67 = 0;
                      }

                      if (v67)
                      {
                        uint64_t v29 = [v4 workflowID];
                        workflowID = v5->_workflowID;
                        v5->_workflowID = (NSString *)v29;

                        uint64_t v31 = [v4 createdAt];
                        createdAt = v5->_createdAt;
                        v5->_createdAt = (NSDate *)v31;

                        uint64_t v33 = [v4 assessment];
                        assessment = v5->_assessment;
                        v5->_assessment = (NSString *)v33;

                        uint64_t v35 = [v4 trainingData];
                        trainingData = v5->_trainingData;
                        v5->_trainingData = (NSString *)v35;

                        uint64_t v37 = [v4 trainingSignalID];
                        trainingSignalID = v5->_trainingSignalID;
                        v5->_trainingSignalID = (NSString *)v37;

                        uint64_t v39 = [v4 assessmentGUID];
                        assessmentGUID = v5->_assessmentGUID;
                        v5->_assessmentGUID = (NSString *)v39;

                        uint64_t v41 = [v4 assessmentGUIDSeeds];
                        assessmentGUIDSeeds = v5->_assessmentGUIDSeeds;
                        v5->_assessmentGUIDSeeds = (NSString *)v41;

                        uint64_t v43 = [v4 trainingGUID];
                        trainingGUID = v5->_trainingGUID;
                        v5->_trainingGUID = (NSString *)v43;

                        uint64_t v45 = [v4 trainingGUIDSeeds];
                        trainingGUIDSeeds = v5->_trainingGUIDSeeds;
                        v5->_trainingGUIDSeeds = (NSString *)v45;

                        uint64_t v47 = [v4 digestIndex];
                        digestIndex = v5->_digestIndex;
                        v5->_digestIndex = (NSNumber *)v47;

                        uint64_t v49 = [v4 bindings];
                        bindingsRecords = v5->_bindingsRecords;
                        v5->_bindingsRecords = (NSDictionary *)v49;

                        uint64_t v51 = [v4 bindingsToCompare];
                        bindingsToCompare = v5->_bindingsToCompare;
                        v5->_bindingsToCompare = (NSArray *)v51;

                        uint64_t v53 = [v4 refreshTTL];
                        refreshTTL = v5->_refreshTTL;
                        v5->_refreshTTL = (NSNumber *)v53;

                        uint64_t v55 = [v4 encryptedTSID];
                        encryptedTSID = v5->_encryptedTSID;
                        v5->_encryptedTSID = (NSString *)v55;

                        uint64_t v57 = [v4 encryptedAGUID];
                        encryptedAGUID = v5->_encryptedAGUID;
                        v5->_encryptedAGUID = (NSString *)v57;

                        v5->_shouldSendOTD = [v4 shouldSendOTD];
                        uint64_t v59 = [v4 otdDestinationHost];
                        otdDestinationHost = v5->_otdDestinationHost;
                        v5->_otdDestinationHost = (NSString *)v59;

                        uint64_t v61 = [v4 profileID];
                        profileID = v5->_profileID;
                        v5->_profileID = (NSString *)v61;

                        v6 = v5;
                        goto LABEL_27;
                      }
                      goto LABEL_26;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

LABEL_26:
    v6 = 0;
  }
LABEL_27:

  return v6;
}

- (NSString)workflowID
{
  return self->_workflowID;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (NSString)assessment
{
  return self->_assessment;
}

- (NSString)trainingData
{
  return self->_trainingData;
}

- (NSString)trainingSignalID
{
  return self->_trainingSignalID;
}

- (NSString)assessmentGUID
{
  return self->_assessmentGUID;
}

- (NSString)assessmentGUIDSeeds
{
  return self->_assessmentGUIDSeeds;
}

- (NSString)trainingGUID
{
  return self->_trainingGUID;
}

- (NSString)trainingGUIDSeeds
{
  return self->_trainingGUIDSeeds;
}

- (NSNumber)digestIndex
{
  return self->_digestIndex;
}

- (NSDictionary)bindingsRecords
{
  return self->_bindingsRecords;
}

- (NSArray)bindingsToCompare
{
  return self->_bindingsToCompare;
}

- (NSNumber)refreshTTL
{
  return self->_refreshTTL;
}

- (NSString)encryptedTSID
{
  return self->_encryptedTSID;
}

- (NSString)encryptedAGUID
{
  return self->_encryptedAGUID;
}

- (BOOL)shouldSendOTD
{
  return self->_shouldSendOTD;
}

- (NSString)otdDestinationHost
{
  return self->_otdDestinationHost;
}

- (NSString)profileID
{
  return self->_profileID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileID, 0);
  objc_storeStrong((id *)&self->_otdDestinationHost, 0);
  objc_storeStrong((id *)&self->_encryptedAGUID, 0);
  objc_storeStrong((id *)&self->_encryptedTSID, 0);
  objc_storeStrong((id *)&self->_refreshTTL, 0);
  objc_storeStrong((id *)&self->_bindingsToCompare, 0);
  objc_storeStrong((id *)&self->_bindingsRecords, 0);
  objc_storeStrong((id *)&self->_digestIndex, 0);
  objc_storeStrong((id *)&self->_trainingGUIDSeeds, 0);
  objc_storeStrong((id *)&self->_trainingGUID, 0);
  objc_storeStrong((id *)&self->_assessmentGUIDSeeds, 0);
  objc_storeStrong((id *)&self->_assessmentGUID, 0);
  objc_storeStrong((id *)&self->_trainingSignalID, 0);
  objc_storeStrong((id *)&self->_trainingData, 0);
  objc_storeStrong((id *)&self->_assessment, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);

  objc_storeStrong((id *)&self->_workflowID, 0);
}

@end