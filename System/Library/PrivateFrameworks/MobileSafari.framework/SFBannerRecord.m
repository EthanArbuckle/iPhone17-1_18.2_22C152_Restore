@interface SFBannerRecord
- (BOOL)updateProductID:(id)a3 time:(id)a4;
- (SFBannerRecord)initWithProductID:(id)a3 time:(id)a4;
@end

@implementation SFBannerRecord

- (SFBannerRecord)initWithProductID:(id)a3 time:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFBannerRecord;
  v8 = [(SFBannerRecord *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(SFBannerRecord *)v8 updateProductID:v6 time:v7];
    v10 = v9;
  }

  return v9;
}

- (BOOL)updateProductID:(id)a3 time:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  updatedProductIDs = self->_updatedProductIDs;
  if (!updatedProductIDs)
  {
    v11 = [MEMORY[0x1E4F1CA48] array];
    objc_super v12 = self->_updatedProductIDs;
    self->_updatedProductIDs = v11;

    [(NSMutableArray *)self->_updatedProductIDs addObject:v6];
    p_lastUpdateTime = &self->_lastUpdateTime;
    goto LABEL_7;
  }
  if ([(NSMutableArray *)updatedProductIDs containsObject:v6])
  {
LABEL_8:
    BOOL v13 = 1;
    goto LABEL_12;
  }
  [v7 timeIntervalSinceDate:self->_lastUpdateTime];
  if (v9 >= exp2((double)(unint64_t)([(NSMutableArray *)self->_updatedProductIDs count] - 1)) * 30.0
    && (unint64_t)[(NSMutableArray *)self->_updatedProductIDs count] <= 3)
  {
    [(NSMutableArray *)self->_updatedProductIDs addObject:v6];
    p_lastUpdateTime = &self->_lastUpdateTime;
LABEL_7:
    objc_storeStrong((id *)p_lastUpdateTime, a4);
    goto LABEL_8;
  }
  v14 = WBS_LOG_CHANNEL_PREFIXBanners();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[SFBannerRecord updateProductID:time:](v14);
  }
  BOOL v13 = 0;
LABEL_12:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdateTime, 0);

  objc_storeStrong((id *)&self->_updatedProductIDs, 0);
}

- (void)updateProductID:(os_log_t)log time:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18C354000, log, OS_LOG_TYPE_ERROR, "Not showing banner because the Web Site tries to show different productIDs.", v1, 2u);
}

@end