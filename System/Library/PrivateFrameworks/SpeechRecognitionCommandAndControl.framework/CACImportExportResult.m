@interface CACImportExportResult
- (CACImportExportResult)initWithError:(id)a3 title:(id)a4 message:(id)a5;
- (NSError)error;
- (NSString)message;
- (NSString)title;
- (void)displayAlertForViewController:(id)a3;
- (void)setError:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CACImportExportResult

- (CACImportExportResult)initWithError:(id)a3 title:(id)a4 message:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CACImportExportResult *)self init];
  v12 = v11;
  if (v11)
  {
    [(CACImportExportResult *)v11 setError:v8];
    [(CACImportExportResult *)v12 setTitle:v9];
    [(CACImportExportResult *)v12 setMessage:v10];
  }

  return v12;
}

- (void)displayAlertForViewController:(id)a3
{
  id v11 = a3;
  v4 = (void *)MEMORY[0x263F82418];
  error = self->_error;
  if (error)
  {
    title = [(NSError *)self->_error localizedDescription];
  }
  else
  {
    title = self->_title;
  }
  v7 = [v4 alertControllerWithTitle:title message:self->_message preferredStyle:0];
  if (error) {

  }
  id v8 = (void *)MEMORY[0x263F82400];
  id v9 = +[CACLocaleUtilities localizedUIStringForKey:@"CommonStrings.OK"];
  id v10 = [v8 actionWithTitle:v9 style:1 handler:&__block_literal_global_45];
  [v7 addAction:v10];

  [v11 presentViewController:v7 animated:1 completion:0];
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end