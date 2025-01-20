@interface BKDigitizerTouchStreamAggregate
- (NSString)description;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation BKDigitizerTouchStreamAggregate

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return (unint64_t)[(NSMutableArray *)self->_clients countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);

  objc_storeStrong((id *)&self->_displayUUID, 0);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100090440;
  v6[3] = &unk_1000F8E50;
  v6[4] = a3;
  v6[5] = self;
  [a3 appendProem:self block:v6];
  id v5 = [a3 appendObject:self->_clients withName:@"clients"];
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:self];
}

@end