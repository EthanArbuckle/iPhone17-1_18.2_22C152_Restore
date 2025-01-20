@interface UIAssignToContactActivity
+ (BOOL)_isCapabilityBasedActivity;
+ (unint64_t)_xpcAttributes;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4;
- (CNContact)person;
- (CNContactPickerViewController)peoplePicker;
- (UIImage)image;
- (UIImagePickerController)imagePickerController;
- (id)_embeddedActivityViewController;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (void)_cleanup;
- (void)_willPresentAsFormSheet;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)prepareWithActivityItems:(id)a3;
- (void)setImage:(id)a3;
- (void)setImagePickerController:(id)a3;
- (void)setPeoplePicker:(id)a3;
- (void)setPerson:(id)a3;
@end

@implementation UIAssignToContactActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    return 3;
  }
  else {
    return 0;
  }
}

+ (BOOL)_isCapabilityBasedActivity
{
  return 1;
}

- (id)activityType
{
  return @"com.apple.UIKit.activity.AssignToContact";
}

- (id)_systemImageName
{
  return @"person.crop.circle";
}

- (id)activityTitle
{
  uint64_t v2 = _ShareSheetBundle();
  v3 = [v2 localizedStringForKey:@"Assign to Contact[Activity]" value:@"Assign to Contact" table:@"Localizable"];

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v3 = a3;
  if ((_UIActivityItemTypes() & 0x42) == 0 || (_UIActivityItemTypes() & 0x40) != 0) {
    LOBYTE(v4) = 0;
  }
  else {
    BOOL v4 = !_UIActivityHasAtMoreThan(v3, 2, 1);
  }

  return v4;
}

- (void)prepareWithActivityItems:(id)a3
{
  BOOL v4 = (Class (__cdecl *)())getCNContactPickerViewControllerClass;
  id v5 = a3;
  v6 = (CNContactPickerViewController *)objc_alloc_init(v4());
  peoplePicker = self->_peoplePicker;
  self->_peoplePicker = v6;

  -[CNContactPickerViewController setPreferredContentSize:](self->_peoplePicker, "setPreferredContentSize:", 320.0, 426.0);
  v8 = [MEMORY[0x1E4FB16C8] currentDevice];
  -[CNContactPickerViewController setAllowsCancel:](self->_peoplePicker, "setAllowsCancel:", [v8 userInterfaceIdiom] == 0);

  [(CNContactPickerViewController *)self->_peoplePicker setDelegate:self];
  [(CNContactPickerViewController *)self->_peoplePicker setAutocloses:0];
  _UIActivityItemsGetImages(v5, 0, 1);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  v9 = [v11 firstObject];
  image = self->_image;
  self->_image = v9;
}

- (id)_embeddedActivityViewController
{
  id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4) {
    id v5 = self->_peoplePicker;
  }
  else {
    id v5 = 0;
  }
  return v5;
}

- (void)_willPresentAsFormSheet
{
}

- (id)activityViewController
{
  id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1) {
    id v5 = 0;
  }
  else {
    id v5 = self->_peoplePicker;
  }
  return v5;
}

- (void)_cleanup
{
  id v3 = [(UIAssignToContactActivity *)self peoplePicker];
  [v3 setDelegate:0];

  [(UIAssignToContactActivity *)self setPeoplePicker:0];
  uint64_t v4 = [(UIAssignToContactActivity *)self imagePickerController];
  [v4 setDelegate:0];

  [(UIAssignToContactActivity *)self setImagePickerController:0];
  [(UIAssignToContactActivity *)self setImage:0];
  [(UIAssignToContactActivity *)self setPerson:0];
}

- (void)contactPickerDidCancel:(id)a3
{
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  v18[5] = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)&self->_person, a4);
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4FB1828]);
  v8 = UIImageJPEGRepresentation(self->_image, 1.0);
  v9 = (UIImagePickerController *)objc_msgSend(v7, "_initWithSourceImageData:cropRect:", v8, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  imagePickerController = self->_imagePickerController;
  self->_imagePickerController = v9;

  [(UIImagePickerController *)self->_imagePickerController setDelegate:self];
  [(UIImagePickerController *)self->_imagePickerController setModalPresentationStyle:3];
  [(UIImagePickerController *)self->_imagePickerController _setImagePickerSavingOptions:5];
  id v11 = (void *)MEMORY[0x1E4F1CA60];
  v12 = [(UIImagePickerController *)self->_imagePickerController _properties];
  v13 = [v11 dictionaryWithDictionary:v12];

  uint64_t v14 = *MEMORY[0x1E4FB31D8];
  v17[0] = *MEMORY[0x1E4FB29F0];
  v17[1] = v14;
  v18[0] = MEMORY[0x1E4F1CC38];
  v18[1] = MEMORY[0x1E4F1CC38];
  uint64_t v15 = *MEMORY[0x1E4FB3250];
  v17[2] = *MEMORY[0x1E4FB3210];
  v17[3] = v15;
  v18[2] = MEMORY[0x1E4F1CC38];
  v18[3] = MEMORY[0x1E4F1CC38];
  v17[4] = *MEMORY[0x1E4FB31D0];
  v18[4] = MEMORY[0x1E4F1CC38];
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  [v13 addEntriesFromDictionary:v16];

  [(UIImagePickerController *)self->_imagePickerController _setProperties:v13];
  [(CNContactPickerViewController *)self->_peoplePicker setModalPresentationStyle:16];
  [(CNContactPickerViewController *)self->_peoplePicker presentViewController:self->_imagePickerController withTransition:1 completion:0];
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v30 = a4;
  id v5 = self->_person;
  id v6 = [v30 objectForKey:*MEMORY[0x1E4FB2A00]];
  id v7 = UIImageJPEGRepresentation(v6, 0.8);

  v8 = [v30 objectForKey:*MEMORY[0x1E4FB3218]];
  v9 = UIImageJPEGRepresentation(v8, 0.8);

  v10 = [v30 objectForKey:*MEMORY[0x1E4FB3230]];
  if (!v10)
  {
    id v11 = [v30 objectForKey:*MEMORY[0x1E4FB2A28]];
    v10 = UIImageJPEGRepresentation(v11, 0.8);
  }
  v12 = [v30 objectForKey:*MEMORY[0x1E4FB29F8]];
  v13 = v12;
  if (v12)
  {
    [v12 CGRectValue];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
  }
  else
  {
    double v15 = *MEMORY[0x1E4F1DB28];
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  v22 = (void *)[(CNContact *)v5 mutableCopy];
  v23 = v22;
  if (v10) {
    [v22 setImageData:v10];
  }
  if (v7)
  {
    v24 = getCNContactThumbnailImageDataKey();
    [v23 setValue:v7 forKey:v24];

    v25 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v15, v17, v19, v21);
    v26 = getCNContactCropRectKey();
    [v23 setValue:v25 forKey:v26];
  }
  if (v9)
  {
    v27 = getCNContactFullscreenImageDataKey();
    [v23 setValue:v9 forKey:v27];
  }
  v28 = [(objc_class *)getCNContactViewControllerClass() viewControllerForUpdatingContact:v23 withPropertiesFromContact:v23];
  [v28 setDelegate:self];
  v29 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v28];
  [v29 setModalPresentationStyle:3];
  [(UIImagePickerController *)self->_imagePickerController presentViewController:v29 animated:1 completion:0];
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  return 1;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  [(UIActivity *)self activityDidFinish:a4 != 0];
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (CNContactPickerViewController)peoplePicker
{
  return self->_peoplePicker;
}

- (void)setPeoplePicker:(id)a3
{
}

- (CNContact)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
}

- (UIImagePickerController)imagePickerController
{
  return self->_imagePickerController;
}

- (void)setImagePickerController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagePickerController, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_peoplePicker, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end