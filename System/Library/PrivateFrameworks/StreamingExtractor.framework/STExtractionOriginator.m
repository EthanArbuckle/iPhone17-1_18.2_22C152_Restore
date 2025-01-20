@interface STExtractionOriginator
- (STExtractionOriginatorProtocol)originator;
- (void)remote_extractionCompleteAtArchivePath:(id)a3;
- (void)remote_extractionEnteredPassthroughMode;
- (void)remote_setExtractionProgress:(double)a3;
- (void)setOriginator:(id)a3;
@end

@implementation STExtractionOriginator

- (void)remote_setExtractionProgress:(double)a3
{
  v4 = [(STExtractionOriginator *)self originator];
  if (v4)
  {
    id v5 = v4;
    objc_msgSend(v4, "remote_setExtractionProgress:", a3);
    v4 = v5;
  }
}

- (void)remote_extractionCompleteAtArchivePath:(id)a3
{
  id v6 = a3;
  v4 = [(STExtractionOriginator *)self originator];
  id v5 = v4;
  if (v4) {
    objc_msgSend(v4, "remote_extractionCompleteAtArchivePath:", v6);
  }
}

- (void)remote_extractionEnteredPassthroughMode
{
  v2 = [(STExtractionOriginator *)self originator];
  if (v2)
  {
    id v3 = v2;
    objc_msgSend(v2, "remote_extractionEnteredPassthroughMode");
    v2 = v3;
  }
}

- (STExtractionOriginatorProtocol)originator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originator);
  return (STExtractionOriginatorProtocol *)WeakRetained;
}

- (void)setOriginator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end