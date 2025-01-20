@interface RAPReportComposerDirectionsSubcategorySection
- (RAPReportComposerDirectionsSubcategorySection)initWithQuestion:(id)a3 selection:(id)a4;
- (id)cellForRowAtIndex:(int64_t)a3;
- (int64_t)rowsCount;
- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4;
@end

@implementation RAPReportComposerDirectionsSubcategorySection

- (RAPReportComposerDirectionsSubcategorySection)initWithQuestion:(id)a3 selection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RAPReportComposerDirectionsSubcategorySection;
  v9 = [(RAPTablePartSection *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_question, a3);
    id v11 = objc_retainBlock(v8);
    id selection = v10->_selection;
    v10->_id selection = v11;

    [(RAPMenu *)v10->_question addObserver:v10 changeHandler:&stru_1013163C0];
  }

  return v10;
}

- (int64_t)rowsCount
{
  v2 = [(RAPMenu *)self->_question allMenuItems];
  id v3 = [v2 count];

  return (int64_t)v3;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  v5 = [(RAPTablePartSection *)self dequeueDefaultSingleLineTableViewCell];
  v6 = [(RAPMenu *)self->_question allMenuItems];
  id v7 = [v6 objectAtIndexedSubscript:a3];

  id v8 = [v7 localizedTitle];
  v9 = [v5 textLabel];
  [v9 setText:v8];

  [v5 setAccessoryType:1];

  return v5;
}

- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  v6 = [(RAPMenu *)self->_question allMenuItems];
  id v8 = [v6 objectAtIndexedSubscript:a3];

  [(RAPMenu *)self->_question setSelectedMenuItem:v8];
  id selection = (void (**)(id, id))self->_selection;
  if (selection) {
    selection[2](selection, v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selection, 0);

  objc_storeStrong((id *)&self->_question, 0);
}

@end