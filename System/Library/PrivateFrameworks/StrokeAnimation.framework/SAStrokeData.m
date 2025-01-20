@interface SAStrokeData
- (SAStrokeData)initWithCharacter:(id)a3 strokeAnimationRepresention:(id)a4 strokeNames:(id)a5 pronunciation:(id)a6;
- (SAStrokeData)initWithCharacters:(id)a3 strokeAnimationRepresention:(id)a4 strokeNames:(id)a5 pronunciations:(id)a6;
- (SAStrokeDataInternal)underlyingObject;
- (void)setUnderlyingObject:(id)a3;
@end

@implementation SAStrokeData

- (SAStrokeData)initWithCharacter:(id)a3 strokeAnimationRepresention:(id)a4 strokeNames:(id)a5 pronunciation:(id)a6
{
  v30[1] = *MEMORY[0x263EF8340];
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = 0;
  objc_storeStrong(&v26, a4);
  id v25 = 0;
  objc_storeStrong(&v25, a5);
  id v24 = 0;
  objc_storeStrong(&v24, a6);
  v6 = v28;
  v28 = 0;
  v23.receiver = v6;
  v23.super_class = (Class)SAStrokeData;
  v18 = [(SAStrokeData *)&v23 init];
  v28 = v18;
  objc_storeStrong((id *)&v28, v18);
  if (v18)
  {
    v14 = [SAStrokeDataInternal alloc];
    char v21 = 0;
    if (location[0])
    {
      v30[0] = location[0];
      id v22 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
      char v21 = 1;
      id v13 = v22;
    }
    else
    {
      id v13 = 0;
    }
    id v11 = v26;
    id v12 = v25;
    char v19 = 0;
    if (v24)
    {
      id v29 = v24;
      id v20 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
      char v19 = 1;
      id v10 = v20;
    }
    else
    {
      id v10 = 0;
    }
    v9 = [(SAStrokeDataInternal *)v14 initWithCharacters:v13 strokeAnimationRepresention:v11 strokeNames:v12 pronunciations:v10];
    -[SAStrokeData setUnderlyingObject:](v28, "setUnderlyingObject:");

    if (v19) {
    if (v21)
    }
  }
  v8 = v28;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v28, 0);
  return v8;
}

- (SAStrokeData)initWithCharacters:(id)a3 strokeAnimationRepresention:(id)a4 strokeNames:(id)a5 pronunciations:(id)a6
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  id v17 = 0;
  objc_storeStrong(&v17, a5);
  id v16 = 0;
  objc_storeStrong(&v16, a6);
  v6 = v20;
  id v20 = 0;
  v15.receiver = v6;
  v15.super_class = (Class)SAStrokeData;
  v14 = [(SAStrokeData *)&v15 init];
  id v20 = v14;
  objc_storeStrong((id *)&v20, v14);
  if (v14)
  {
    v7 = [SAStrokeDataInternal alloc];
    id v10 = [(SAStrokeDataInternal *)v7 initWithCharacters:location[0] strokeAnimationRepresention:v18 strokeNames:v17 pronunciations:v16];
    -[SAStrokeData setUnderlyingObject:](v20, "setUnderlyingObject:");
  }
  v9 = v20;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v20, 0);
  return v9;
}

- (SAStrokeDataInternal)underlyingObject
{
  return self->_underlyingObject;
}

- (void)setUnderlyingObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end