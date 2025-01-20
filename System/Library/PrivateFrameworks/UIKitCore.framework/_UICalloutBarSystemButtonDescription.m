@interface _UICalloutBarSystemButtonDescription
+ (id)buttonDescriptionWithImage:(id)a3 action:(SEL)a4 type:(int)a5;
+ (id)buttonDescriptionWithTitle:(id)a3 action:(SEL)a4 type:(int)a5;
+ (id)buttonDescriptionWithTitle:(id)a3 image:(id)a4 action:(SEL)a5 type:(int)a6;
- (NSString)title;
- (SEL)action;
- (_UICalloutBarSystemButtonDescription)initWithTitle:(id)a3 orImage:(id)a4 action:(SEL)a5 type:(int)a6;
- (id)configurationBlock;
- (id)materializeButtonInView:(id)a3 visualStyle:(id)a4;
- (void)setConfigurationBlock:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _UICalloutBarSystemButtonDescription

- (_UICalloutBarSystemButtonDescription)initWithTitle:(id)a3 orImage:(id)a4 action:(SEL)a5 type:(int)a6
{
  id v11 = a3;
  id v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_UICalloutBarSystemButtonDescription;
  v13 = [(_UICalloutBarSystemButtonDescription *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->m_title, a3);
    objc_storeStrong((id *)&v14->m_image, a4);
    if (a5) {
      SEL v15 = a5;
    }
    else {
      SEL v15 = 0;
    }
    v14->m_action = v15;
    v14->m_type = a6;
  }

  return v14;
}

+ (id)buttonDescriptionWithTitle:(id)a3 action:(SEL)a4 type:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)a1) initWithTitle:v8 orImage:0 action:a4 type:v5];

  return v9;
}

+ (id)buttonDescriptionWithImage:(id)a3 action:(SEL)a4 type:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)a1) initWithTitle:0 orImage:v8 action:a4 type:v5];

  return v9;
}

+ (id)buttonDescriptionWithTitle:(id)a3 image:(id)a4 action:(SEL)a5 type:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)[objc_alloc((Class)a1) initWithTitle:v11 orImage:v10 action:a5 type:v6];

  return v12;
}

- (id)materializeButtonInView:(id)a3 visualStyle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  m_image = self->m_image;
  if (m_image)
  {
    if (self->m_title) {
      +[UICalloutBarButton buttonWithTitle:image:action:type:inView:visualStyle:](UICalloutBarButton, "buttonWithTitle:image:action:type:inView:visualStyle:");
    }
    else {
    uint64_t v10 = +[UICalloutBarButton buttonWithImage:m_image action:self->m_action type:self->m_type inView:v6 visualStyle:v7];
    }
  }
  else
  {
    if (self->m_action) {
      SEL m_action = self->m_action;
    }
    else {
      SEL m_action = 0;
    }
    uint64_t v10 = +[UICalloutBarButton buttonWithTitle:self->m_title action:m_action type:self->m_type inView:v6 visualStyle:v7];
  }
  id v11 = (void *)v10;
  id v12 = [(_UICalloutBarSystemButtonDescription *)self configurationBlock];

  if (v12)
  {
    v13 = [(_UICalloutBarSystemButtonDescription *)self configurationBlock];
    ((void (**)(void, void *))v13)[2](v13, v11);
  }
  return v11;
}

- (SEL)action
{
  if (self->m_action) {
    return self->m_action;
  }
  else {
    return 0;
  }
}

- (NSString)title
{
  return self->m_title;
}

- (void)setTitle:(id)a3
{
}

- (id)configurationBlock
{
  return self->m_configurationBlock;
}

- (void)setConfigurationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->m_configurationBlock, 0);
  objc_storeStrong((id *)&self->m_image, 0);
  objc_storeStrong((id *)&self->m_title, 0);
}

@end