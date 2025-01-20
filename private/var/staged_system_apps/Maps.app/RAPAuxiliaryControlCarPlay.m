@interface RAPAuxiliaryControlCarPlay
- (BOOL)isSameControlAsControl:(id)a3;
- (GEORPCarPlayAuxiliaryControl)reportAProblemControlMessage;
- (RAPAuxiliaryControlCarPlay)initWithInformationFromDevice:(id)a3 accessory:(id)a4 displayController:(id)a5;
@end

@implementation RAPAuxiliaryControlCarPlay

- (RAPAuxiliaryControlCarPlay)initWithInformationFromDevice:(id)a3 accessory:(id)a4 displayController:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RAPAuxiliaryControlCarPlay;
  v10 = [(RAPAuxiliaryControlCarPlay *)&v19 init];
  if (!v10) {
    goto LABEL_6;
  }
  v11 = 0;
  if (v8 && a4 && v9)
  {
    v12 = [v8 ID];
    v13 = (NSString *)[v12 copy];
    ID = v10->_ID;
    v10->_ID = v13;

    v15 = [v9 connectedCarMainScreenInfo];
    v16 = (GEORPCarPlayAuxiliaryControl *)objc_alloc_init((Class)GEORPCarPlayAuxiliaryControl);
    reportAProblemControlMessage = v10->_reportAProblemControlMessage;
    v10->_reportAProblemControlMessage = v16;

    [(GEORPCarPlayAuxiliaryControl *)v10->_reportAProblemControlMessage setCarInfo:v15];
LABEL_6:
    v11 = v10;
  }

  return v11;
}

- (BOOL)isSameControlAsControl:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  v6 = v5;
  if (v6) {
    unsigned __int8 v7 = [(NSString *)self->_ID isEqual:v6[1]];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (GEORPCarPlayAuxiliaryControl)reportAProblemControlMessage
{
  return self->_reportAProblemControlMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportAProblemControlMessage, 0);

  objc_storeStrong((id *)&self->_ID, 0);
}

@end