@interface ICNote(AirDropDocumentUI)
+ (void)createNoteForAirDropDocument:()AirDropDocumentUI legacyContext:completion:;
@end

@implementation ICNote(AirDropDocumentUI)

+ (void)createNoteForAirDropDocument:()AirDropDocumentUI legacyContext:completion:
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__ICNote_AirDropDocumentUI__createNoteForAirDropDocument_legacyContext_completion___block_invoke;
  v12[3] = &unk_1E5FDBA08;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [a1 createNoteForAirDropDocument:a3 legacyContext:v11 processAttributedString:v12 completion:v10];
}

@end