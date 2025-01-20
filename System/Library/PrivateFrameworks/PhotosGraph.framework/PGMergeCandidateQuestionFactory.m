@interface PGMergeCandidateQuestionFactory
- (PGMergeCandidateQuestionFactory)initWithWorkingContext:(id)a3 questionVersion:(signed __int16)a4;
- (PHFetchResult)persons;
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
- (void)setPersons:(id)a3;
@end

@implementation PGMergeCandidateQuestionFactory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persons, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

- (void)setPersons:(id)a3
{
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v29 = a4;
  v5 = [(PGMergeCandidateQuestionFactory *)self persons];
  v6 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
  v7 = [v6 librarySpecificFetchOptions];

  [v7 setFetchLimit:9];
  v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"faceCount" ascending:0];
  v45[0] = v8;
  v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v45[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  [v7 setSortDescriptors:v10];

  v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"verifiedType == %d", 0);
  v33 = v7;
  [v7 setPredicate:v11];

  v30 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v5;
  uint64_t v12 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v32 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v39 != v32) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1D25FED50]();
        v17 = [MEMORY[0x1E4F391F0] fetchMergeCandidatePersonsForPerson:v15 options:v33];
        if ([v17 count])
        {
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v18 = v17;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            unint64_t v21 = 0;
            uint64_t v22 = *(void *)v35;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v35 != v22) {
                  objc_enumerationMutation(v18);
                }
                v21 += [*(id *)(*((void *)&v34 + 1) + 8 * j) faceCount];
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v43 count:16];
            }
            while (v20);
          }
          else
          {
            unint64_t v21 = 0;
          }

          double v24 = (double)[v15 faceCount] / (double)v21;
          if (v24 > 0.0)
          {
            v25 = [[PGMergeCandidateQuestion alloc] initWithPerson:v15 score:v24];
            [v30 addObject:v25];
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v13);
  }

  v26 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:0];
  v42 = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  [v30 sortUsingDescriptors:v27];

  return v30;
}

- (int64_t)questionOptions
{
  return 2;
}

- (unsigned)questionType
{
  return 2;
}

- (PHFetchResult)persons
{
  persons = self->_persons;
  if (!persons)
  {
    v4 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
    v5 = +[PGPeopleQuestionFactoryUtils personsWithPeopleHomeContextForPhotoLibrary:v4];
    v6 = self->_persons;
    self->_persons = v5;

    persons = self->_persons;
  }
  return persons;
}

- (PGMergeCandidateQuestionFactory)initWithWorkingContext:(id)a3 questionVersion:(signed __int16)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGMergeCandidateQuestionFactory;
  v8 = [(PGMergeCandidateQuestionFactory *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_workingContext, a3);
    v9->_questionVersion = a4;
  }

  return v9;
}

@end