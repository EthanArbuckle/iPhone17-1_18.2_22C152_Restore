@interface CRLWPInteriorCookie
- (CRLWPColumn)column;
- (CRLWPLayoutTarget)layout;
- (CRLWrapSegments)interiorWrapSegmentsInWrapSpace;
- (void)setColumn:(id)a3;
- (void)setInteriorWrapSegmentsInWrapSpace:(id)a3;
- (void)setLayout:(id)a3;
@end

@implementation CRLWPInteriorCookie

- (CRLWPColumn)column
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_column);

  return (CRLWPColumn *)WeakRetained;
}

- (void)setColumn:(id)a3
{
}

- (CRLWPLayoutTarget)layout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);

  return (CRLWPLayoutTarget *)WeakRetained;
}

- (void)setLayout:(id)a3
{
}

- (CRLWrapSegments)interiorWrapSegmentsInWrapSpace
{
  return self->_interiorWrapSegmentsInWrapSpace;
}

- (void)setInteriorWrapSegmentsInWrapSpace:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interiorWrapSegmentsInWrapSpace, 0);
  objc_destroyWeak((id *)&self->_layout);

  objc_destroyWeak((id *)&self->_column);
}

@end