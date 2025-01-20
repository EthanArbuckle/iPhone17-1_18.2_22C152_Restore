@interface BKBookletMigrationDownloadFlowState
- (BKBookletMigrationDownloadFlowState)initWithStage:(unint64_t)a3;
- (id)description;
- (unint64_t)stage;
- (void)setStage:(unint64_t)a3;
@end

@implementation BKBookletMigrationDownloadFlowState

- (BKBookletMigrationDownloadFlowState)initWithStage:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKBookletMigrationDownloadFlowState;
  result = [(BKBookletMigrationDownloadFlowState *)&v5 init];
  if (result) {
    result->_stage = a3;
  }
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:@"%lu", [(BKBookletMigrationDownloadFlowState *)self stage]];
}

- (unint64_t)stage
{
  return self->_stage;
}

- (void)setStage:(unint64_t)a3
{
  self->_stage = a3;
}

@end