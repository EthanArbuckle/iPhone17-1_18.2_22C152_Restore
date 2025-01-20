@interface BFFPaneHeaderView_RemoteUI
- (BFFPaneHeaderView_RemoteUI)initWithAttributes:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailText:(id)a3 attributes:(id)a4;
- (void)setImageAlignment:(int)a3;
- (void)setSubHeaderText:(id)a3 attributes:(id)a4;
- (void)setText:(id)a3 attributes:(id)a4;
@end

@implementation BFFPaneHeaderView_RemoteUI

- (BFFPaneHeaderView_RemoteUI)initWithAttributes:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BFFPaneHeaderView_RemoteUI;
  return -[BFFPaneHeaderView initWithFrame:](&v4, sel_initWithFrame_, a3, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (void)setText:(id)a3 attributes:(id)a4
{
  id v5 = a3;
  id v6 = [(BFFPaneHeaderView *)self detailTextLabel];
  [v6 setText:v5];
}

- (void)setSubHeaderText:(id)a3 attributes:(id)a4
{
  id v5 = a3;
  id v6 = [(BFFPaneHeaderView *)self subLabel];
  [v6 setText:v5];
}

- (void)setDetailText:(id)a3 attributes:(id)a4
{
  objc_super v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21FF9E000, v4, OS_LOG_TYPE_DEFAULT, "Detail text is not supported with setupAssistant-style title headers", v5, 2u);
  }
}

- (void)setImageAlignment:(int)a3
{
  v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_21FF9E000, v3, OS_LOG_TYPE_DEFAULT, "Image alignment is not supported with setupAssistant-style title headers", v4, 2u);
  }
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end