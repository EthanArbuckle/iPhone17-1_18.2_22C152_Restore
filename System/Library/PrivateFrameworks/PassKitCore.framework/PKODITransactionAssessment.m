@interface PKODITransactionAssessment
- (PKODITransactionAssessment)init;
- (PKODITransactionAssessment)initWithAssessmentType:(unint64_t)a3;
- (unint64_t)assessmentType;
- (void)createODISession;
- (void)createODISessionWithType:(unint64_t)a3;
- (void)getAssessmentWithCompletion:(id)a3;
- (void)setAssessmentType:(unint64_t)a3;
@end

@implementation PKODITransactionAssessment

- (PKODITransactionAssessment)init
{
  return [(PKODITransactionAssessment *)self initWithAssessmentType:0];
}

- (PKODITransactionAssessment)initWithAssessmentType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKODITransactionAssessment;
  result = [(PKODIAssessment *)&v5 init];
  if (result) {
    result->_assessmentType = a3;
  }
  return result;
}

- (void)createODISession
{
  unint64_t v3 = [(PKODITransactionAssessment *)self assessmentType];
  [(PKODITransactionAssessment *)self createODISessionWithType:v3];
}

- (void)createODISessionWithType:(unint64_t)a3
{
  if (!a3)
  {
    v4 = (id *)MEMORY[0x1E4F5CB60];
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v4 = (id *)MEMORY[0x1E4F5CB68];
LABEL_5:
    id v8 = *v4;
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:
  id v5 = objc_alloc(MEMORY[0x1E4F5C988]);
  v6 = PKPassKitCoreBundle();
  v7 = (void *)[v5 initWithServiceIdentifier:v8 forDSIDType:1 andLocationBundle:v6];
  [(PKODIAssessment *)self setOdiSession:v7];
}

- (void)getAssessmentWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    id v5 = [(PKODIAssessment *)self odiSession];

    if (v5)
    {
      v6 = [(PKODIAssessment *)self odiSession];
      [v6 getAssessmentForTransaction:v7];
    }
    else
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
    id v4 = v7;
  }
}

- (unint64_t)assessmentType
{
  return self->_assessmentType;
}

- (void)setAssessmentType:(unint64_t)a3
{
  self->_assessmentType = a3;
}

@end