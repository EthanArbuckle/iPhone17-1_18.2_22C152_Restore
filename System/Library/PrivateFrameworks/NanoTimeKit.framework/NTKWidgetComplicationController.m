@interface NTKWidgetComplicationController
+ (BOOL)_acceptsComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5;
+ (BOOL)_isLegacy;
- (BOOL)hasTapAction;
- (BOOL)wantsLegacyDisplay;
- (Class)richComplicationDisplayViewClass;
- (NTKWidgetComplicationController)initWithComplication:(id)a3 variant:(id)a4 device:(id)a5;
- (id)complicationApplicationIdentifier;
- (void)addDisplayWrapper:(id)a3;
- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4;
@end

@implementation NTKWidgetComplicationController

- (NTKWidgetComplicationController)initWithComplication:(id)a3 variant:(id)a4 device:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NTKWidgetComplicationController;
  v11 = [(NTKComplicationController *)&v15 initWithComplication:v9 variant:v10 device:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_variant, a4);
    if ([v9 complicationType] != 56)
    {
      v13 = _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[NTKWidgetComplicationController initWithComplication:variant:device:]((uint64_t)v9, v13);
      }
    }
    objc_storeStrong((id *)&v12->_widgetComplication, a3);
  }

  return v12;
}

- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKWidgetComplicationController;
  id v6 = a4;
  [(NTKComplicationController *)&v7 setDisplayProperties:a3 forDisplayWrapper:v6];
  -[NTKWidgetComplicationController _updateStateForDisplayWrapper:](self, "_updateStateForDisplayWrapper:", v6, v7.receiver, v7.super_class);
}

+ (BOOL)_isLegacy
{
  return 0;
}

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5
{
  return a3 == 56;
}

- (void)addDisplayWrapper:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKWidgetComplicationController;
  [(NTKComplicationController *)&v11 addDisplayWrapper:v4];
  v5 = [(NTKComplicationController *)self device];
  id v6 = +[NTKCompanionWidgetComplicationManager instanceForDevice:v5];
  p_widgetComplication = &self->_widgetComplication;
  v8 = [(NTKWidgetComplication *)self->_widgetComplication descriptor];
  id v9 = objc_msgSend(v6, "sampleTemplateForWidget:family:", v8, -[NTKComplicationController complicationFamily](self, "complicationFamily"));

  [v9 finalize];
  if (!v9)
  {
    id v10 = _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[NTKWidgetComplicationController addDisplayWrapper:]((id *)p_widgetComplication, v10);
    }
  }
  [v4 setComplicationTemplate:v9 reason:0 animation:0];
}

- (id)complicationApplicationIdentifier
{
  return [(NTKWidgetComplication *)self->_widgetComplication appIdentifier];
}

- (Class)richComplicationDisplayViewClass
{
  return 0;
}

- (BOOL)hasTapAction
{
  return 1;
}

- (BOOL)wantsLegacyDisplay
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variant, 0);

  objc_storeStrong((id *)&self->_widgetComplication, 0);
}

- (void)initWithComplication:(uint64_t)a1 variant:(NSObject *)a2 device:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_fault_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_FAULT, "NTKWidgetComplicationController created with a complication of unsupported class %@", (uint8_t *)&v4, 0xCu);
}

- (void)addDisplayWrapper:(id *)a1 .cold.1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [*a1 descriptor];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Unable to find sample template for %@", (uint8_t *)&v4, 0xCu);
}

@end