@interface _PUIDSceneBag
- (NSString)description;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation _PUIDSceneBag

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001AAB4;
  v5[3] = &unk_100044C88;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  [v4 appendProem:self block:v5];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_display);
  objc_destroyWeak((id *)&self->_pointerRenderingScene);
  objc_destroyWeak((id *)&self->_systemPointerScene);
}

@end