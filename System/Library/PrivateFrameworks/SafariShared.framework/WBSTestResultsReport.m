@interface WBSTestResultsReport
+ (id)reportForActualResults:(id)a3 expectedResults:(id)a4 expectedResultsName:(id)a5 uniformTypeIdentifier:(id)a6 forStage:(id)a7 forTest:(id)a8 inBundle:(id)a9;
+ (id)reportForError:(id)a3 forStage:(id)a4 forTest:(id)a5 inBundle:(id)a6;
+ (id)reportForPerformance:(id)a3 forStage:(id)a4 forTest:(id)a5 inBundle:(id)a6;
- (NSData)resultsActual;
- (NSData)resultsExpected;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)performanceValues;
- (NSNumber)errorCode;
- (NSString)bundleIdentifier;
- (NSString)errorDomain;
- (NSString)errorMessage;
- (NSString)resultsExpectedName;
- (NSString)resultsUniformTypeIdentifier;
- (NSString)testIdentifier;
- (NSString)testStage;
- (WBSTestResultsReport)initWithDictionaryRepresentation:(id)a3;
- (unint64_t)reportType;
@end

@implementation WBSTestResultsReport

- (WBSTestResultsReport)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSTestResultsReport;
  v5 = [(WBSTestResultsReport *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = (NSDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (unint64_t)reportType
{
  v2 = [(NSDictionary *)self->_dictionaryRepresentation safari_stringForKey:@"type"];
  if ([v2 isEqualToString:@"results"])
  {
    unint64_t v3 = 1;
  }
  else if ([v2 isEqualToString:@"performance"])
  {
    unint64_t v3 = 2;
  }
  else if ([v2 isEqualToString:@"error"])
  {
    unint64_t v3 = 3;
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)[(NSDictionary *)self->_dictionaryRepresentation safari_stringForKey:@"testBundle"];
}

- (NSString)testIdentifier
{
  return (NSString *)[(NSDictionary *)self->_dictionaryRepresentation safari_stringForKey:@"testIdentifier"];
}

- (NSString)testStage
{
  return (NSString *)[(NSDictionary *)self->_dictionaryRepresentation safari_stringForKey:@"stage"];
}

- (NSNumber)errorCode
{
  return (NSNumber *)[(NSDictionary *)self->_dictionaryRepresentation safari_numberForKey:@"code"];
}

- (NSString)errorDomain
{
  return (NSString *)[(NSDictionary *)self->_dictionaryRepresentation safari_stringForKey:@"domain"];
}

- (NSString)errorMessage
{
  return (NSString *)[(NSDictionary *)self->_dictionaryRepresentation safari_stringForKey:@"message"];
}

- (NSDictionary)performanceValues
{
  return (NSDictionary *)[(NSDictionary *)self->_dictionaryRepresentation safari_dictionaryForKey:@"values"];
}

- (NSData)resultsActual
{
  return (NSData *)[(NSDictionary *)self->_dictionaryRepresentation safari_dataForKey:@"actualResults"];
}

- (NSData)resultsExpected
{
  return (NSData *)[(NSDictionary *)self->_dictionaryRepresentation safari_dataForKey:@"expectedResults"];
}

- (NSString)resultsExpectedName
{
  return (NSString *)[(NSDictionary *)self->_dictionaryRepresentation safari_stringForKey:@"expectedResultsName"];
}

- (NSString)resultsUniformTypeIdentifier
{
  return (NSString *)[(NSDictionary *)self->_dictionaryRepresentation safari_stringForKey:@"uti"];
}

+ (id)reportForActualResults:(id)a3 expectedResults:(id)a4 expectedResultsName:(id)a5 uniformTypeIdentifier:(id)a6 forStage:(id)a7 forTest:(id)a8 inBundle:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v22 setObject:@"results" forKeyedSubscript:@"type"];
  if (v21)
  {
    v23 = [v21 identifier];
    [v22 setObject:v23 forKeyedSubscript:@"testBundle"];
  }
  if (v20)
  {
    v24 = [v20 identifier];
    [v22 setObject:v24 forKeyedSubscript:@"testIdentifier"];
  }
  if (v19) {
    [v22 setObject:v19 forKeyedSubscript:@"stage"];
  }
  if (v15) {
    [v22 setObject:v15 forKeyedSubscript:@"actualResults"];
  }
  if (v16) {
    [v22 setObject:v16 forKeyedSubscript:@"expectedResults"];
  }
  if (v17) {
    [v22 setObject:v17 forKeyedSubscript:@"expectedResultsName"];
  }
  if (v18) {
    [v22 setObject:v18 forKeyedSubscript:@"uti"];
  }
  v25 = (void *)[objc_alloc((Class)a1) initWithDictionaryRepresentation:v22];

  return v25;
}

+ (id)reportForPerformance:(id)a3 forStage:(id)a4 forTest:(id)a5 inBundle:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v14 setObject:@"performance" forKeyedSubscript:@"type"];
  if (v13)
  {
    id v15 = [v13 identifier];
    [v14 setObject:v15 forKeyedSubscript:@"testBundle"];
  }
  if (v12)
  {
    id v16 = [v12 identifier];
    [v14 setObject:v16 forKeyedSubscript:@"testIdentifier"];
  }
  if (v11) {
    [v14 setObject:v11 forKeyedSubscript:@"stage"];
  }
  if (v10) {
    [v14 setObject:v10 forKeyedSubscript:@"values"];
  }
  id v17 = (void *)[objc_alloc((Class)a1) initWithDictionaryRepresentation:v14];

  return v17;
}

+ (id)reportForError:(id)a3 forStage:(id)a4 forTest:(id)a5 inBundle:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v14 = a3;
  id v15 = objc_alloc_init(v13);
  [v15 setObject:@"error" forKeyedSubscript:@"type"];
  if (v12)
  {
    id v16 = [v12 identifier];
    [v15 setObject:v16 forKeyedSubscript:@"testBundle"];
  }
  if (v11)
  {
    id v17 = [v11 identifier];
    [v15 setObject:v17 forKeyedSubscript:@"testIdentifier"];
  }
  if (v10) {
    [v15 setObject:v10 forKeyedSubscript:@"stage"];
  }
  id v18 = [v14 domain];
  [v15 setObject:v18 forKeyedSubscript:@"domain"];

  id v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "code"));
  [v15 setObject:v19 forKeyedSubscript:@"code"];

  id v20 = [v14 localizedDescription];

  [v15 setObject:v20 forKeyedSubscript:@"message"];
  id v21 = (void *)[objc_alloc((Class)a1) initWithDictionaryRepresentation:v15];

  return v21;
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void).cxx_destruct
{
}

@end