@interface ActivityPlus
- (ActivityPlus)initWithTitle:(id)a3 image:(id)a4 type:(id)a5 handler:(id)a6;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
@end

@implementation ActivityPlus

- (ActivityPlus)initWithTitle:(id)a3 image:(id)a4 type:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)ActivityPlus;
  v14 = [(UIActivity *)&v21 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    activityTitle = v14->_activityTitle;
    v14->_activityTitle = (NSString *)v15;

    objc_storeStrong((id *)&v14->_activityImage, a4);
    objc_storeStrong((id *)&v14->_activityType, a5);
    uint64_t v17 = MEMORY[0x1E4E42950](v13);
    id actionHandler = v14->_actionHandler;
    v14->_id actionHandler = (id)v17;

    v19 = v14;
  }

  return v14;
}

- (void)performActivity
{
  v4.receiver = self;
  v4.super_class = (Class)ActivityPlus;
  [(UIActivity *)&v4 performActivity];
  id actionHandler = (void (**)(void))self->_actionHandler;
  if (actionHandler) {
    actionHandler[2]();
  }
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (id)activityTitle
{
  return self->_activityTitle;
}

- (id)activityImage
{
  return self->_activityImage;
}

- (id)activityType
{
  return self->_activityType;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_activityImage, 0);
  objc_storeStrong((id *)&self->_activityTitle, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

@end