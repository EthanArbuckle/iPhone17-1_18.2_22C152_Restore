@interface ODCurareModelInformation
- (NSURL)modelURL;
- (ODCurareModelInformation)initWithModelInformation:(id)a3 modelURL:(id)a4;
- (ODCurareReportFillerModelInformation)modelInformation;
- (void)setModelInformation:(id)a3;
- (void)setModelURL:(id)a3;
@end

@implementation ODCurareModelInformation

- (ODCurareModelInformation)initWithModelInformation:(id)a3 modelURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ODCurareModelInformation *)self init];
  v9 = v8;
  if (v8)
  {
    [(ODCurareModelInformation *)v8 setModelInformation:v6];
    [(ODCurareModelInformation *)v9 setModelURL:v7];
  }

  return v9;
}

- (ODCurareReportFillerModelInformation)modelInformation
{
  return self->_modelInformation;
}

- (void)setModelInformation:(id)a3
{
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_modelInformation, 0);
}

@end