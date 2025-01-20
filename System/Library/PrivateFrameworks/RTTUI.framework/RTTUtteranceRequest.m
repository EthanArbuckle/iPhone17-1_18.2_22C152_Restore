@interface RTTUtteranceRequest
+ (id)utteranceRequestWithIndex:(unint64_t)a3 forString:(id)a4 inCellPath:(id)a5 call:(id)a6;
- (NSIndexPath)cellIndexPath;
- (NSString)string;
- (TUCall)call;
- (id)description;
- (unint64_t)index;
- (void)setCall:(id)a3;
- (void)setCellIndexPath:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setString:(id)a3;
@end

@implementation RTTUtteranceRequest

+ (id)utteranceRequestWithIndex:(unint64_t)a3 forString:(id)a4 inCellPath:(id)a5 call:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = objc_alloc_init(RTTUtteranceRequest);
  [(RTTUtteranceRequest *)v12 setIndex:a3];
  [(RTTUtteranceRequest *)v12 setString:v11];

  [(RTTUtteranceRequest *)v12 setCellIndexPath:v10];
  [(RTTUtteranceRequest *)v12 setCall:v9];

  return v12;
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)RTTUtteranceRequest;
  v4 = [(RTTUtteranceRequest *)&v10 description];
  unint64_t v5 = [(RTTUtteranceRequest *)self index];
  v6 = [(RTTUtteranceRequest *)self string];
  v7 = [(RTTUtteranceRequest *)self cellIndexPath];
  v8 = [v3 stringWithFormat:@"%@ [%ld]=%@ - %@", v4, v5, v6, v7];

  return v8;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (NSIndexPath)cellIndexPath
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cellIndexPath);
  return (NSIndexPath *)WeakRetained;
}

- (void)setCellIndexPath:(id)a3
{
}

- (TUCall)call
{
  return self->_call;
}

- (void)setCall:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_call, 0);
  objc_destroyWeak((id *)&self->_cellIndexPath);
  objc_storeStrong((id *)&self->_string, 0);
}

@end